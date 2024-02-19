from flask import Flask, request, jsonify
import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, LSTM, Dense
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

app = Flask(__name__)

df = pd.read_csv("cyberCrime.csv")

df = df.applymap(lambda x: x.replace(' ', '') if isinstance(x, str) else x)
df.head(3)
df = df.astype(str)  # Convert all columns to string type
df['sentence'] = df.apply(lambda row: ','.join(row), axis=1)

# Create a tokenizer while preserving original casing
tokenizer = Tokenizer(lower=False)
tokenizer.fit_on_texts(df['sentence'].values)

total_words = len(tokenizer.word_index) + 1
total_words

input_sequences = []
for sentence in df['sentence']:
  tokenized_sentence = tokenizer.texts_to_sequences([sentence])[0]
  for i in range(1, len(tokenized_sentence)):
    n_gram_sequence = tokenized_sentence[:i + 1]
    input_sequences.append(n_gram_sequence)

max_sequence_length = max(len(seq) for seq in input_sequences)
padded_sequences = pad_sequences(input_sequences,
                                 maxlen=max_sequence_length,
                                 padding='pre')
X = padded_sequences[:, :-1]
y = padded_sequences[:, -1]
y = tf.keras.utils.to_categorical(y, num_classes=total_words)

model = Sequential()
model.add(
    Embedding(input_dim=total_words,
              output_dim=100,
              input_length=max_sequence_length - 1))
model.add(LSTM(100))
model.add(Dense(total_words, activation='softmax'))
model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])
model.fit(X, y, epochs=100, verbose=1)

# Store the reverse mapping from index to word
index_to_word = {v: k for k, v in tokenizer.word_index.items()}


@app.route("/")
def index():
  return "hi"


@app.route("/api", methods=["GET"])
def process():
  # Get crime and process arguments from the request
  input = request.get_json()
  num_words = int(input['num'])
  input_text = input['steps']

  for _ in range(num_words):
    tokenized_input = tokenizer.texts_to_sequences([input_text])[0]
    padded_input = pad_sequences([tokenized_input],
                                 maxlen=max_sequence_length - 1,
                                 padding='pre')
    predicted_word_index = np.argmax(model.predict(padded_input), axis=-1)
    predicted_word = index_to_word[predicted_word_index[0]]
    input_text += " , " + predicted_word
  return jsonify({
      "out": input_text,
  })


if __name__ == "__main__":
  app.run(host="0.0.0.0")
