from flask import Flask, render_template, request,jsonify
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.neighbors import NearestNeighbors

app = Flask(__name__)

# Load CSV data (replace 'crime_data.csv' with your actual CSV file name)
data = pd.read_csv('cyberCrime.csv')

crime_types = data.iloc[:, 1:2]
crime_types = crime_types.values.tolist()

crime_process_steps = data.iloc[:, 2:].values.tolist()

lowercase_steps = [[
    step.lower() if isinstance(step, str) else str(step) for step in sublist
] for sublist in crime_process_steps]

flattened_steps = [step for sublist in lowercase_steps for step in sublist]

vectorizer = TfidfVectorizer()
crime_process_vectors = vectorizer.fit_transform(flattened_steps)

knn = NearestNeighbors(n_neighbors=6)
knn.fit(crime_process_vectors)


def predict_next_step(crime_type, crime_process_steps):
  crime_process_steps_vector = vectorizer.transform(crime_process_steps)
  neighbors = knn.kneighbors(crime_process_steps_vector,
                             return_distance=False)[0]

  if not any(neighbors):
    print("No neighbors found.")
    return None

  # Use modulo to wrap around indices
  neighboring_index = neighbors[0] % len(data)

  neighboring_crime_process = data.iloc[neighboring_index, 2:].values

  next_step = None
  for step in neighboring_crime_process:
    if not pd.isna(step) and step not in crime_process_steps:
      next_step = step
      break

  return next_step


# Flask routes
@app.route('/')
def index():
  return "hi"


@app.route('/predict', methods=['POST'])
def predict():
  if request.method == 'POST':
    input_data = request.get_json()
    crime_type = input_data['crime_type']
    crime_process_steps = input_data['steps'].split(",") # Assuming you have 5 input steps

    next_step = predict_next_step(crime_type, crime_process_steps)
    return jsonify({
    "out": next_step  
    })


if __name__ == '__main__':
  app.run(host="0.0.0.0",port=8080)
