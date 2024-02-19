from flask import Flask, request, jsonify
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.neighbors import NearestNeighbors

app = Flask(__name__)

# Load the data and set up the machine learning model
data = pd.read_csv('cyberCrime.csv')
crime_types = data.iloc[:, 1:2]
crime_types = crime_types.values.tolist()
crime_process_steps = data.iloc[:, 2:].values.tolist()
lowercase_steps = [[step.lower() if isinstance(step, str) else str(step) for step in sublist] for sublist in crime_process_steps]
flattened_steps = [step for sublist in lowercase_steps for step in sublist]
vectorizer = TfidfVectorizer()
crime_process_vectors = vectorizer.fit_transform(flattened_steps)
knn = NearestNeighbors(n_neighbors=5)
knn.fit(crime_process_vectors)

def predict_next_steps(crime_type, crime_process_steps):
    crime_process_steps_vector = vectorizer.transform(crime_process_steps)
    neighbors = knn.kneighbors(crime_process_steps_vector, return_distance=False)

    if not any(neighbors[0]):
        print("No neighbors found.")
        return []

    neighboring_indices = [index % len(data) for index in neighbors[0]]
    neighboring_crime_processes = data.iloc[neighboring_indices, 2:].values.tolist()

    next_steps = []
    for crime_process in neighboring_crime_processes:
        for step in crime_process:
            if not pd.isna(step) and step not in crime_process_steps:
                next_steps.append(step)

    return next_steps


@app.route('/')
def index():
    return "HI"

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Get input data from the request
        input_data = request.get_json()

        # Ensure that 'crime_type' and 'crime_process_steps' are present in the request
        if 'crime_type' not in input_data or 'crime_process_steps' not in input_data:
            return jsonify({'error': 'Invalid request. Both "crime_type" and "crime_process_steps" are required.'}), 400

        crime_type = input_data['crime_type']
        crime_process_steps = input_data['crime_process_steps']

        # Use the machine learning model to make predictions
        next_steps = predict_next_steps(crime_type, crime_process_steps)

        # Return the predictions as JSON
        return jsonify({'next_steps': next_steps})

    except Exception as e:
        return jsonify({'error': f'An error occurred: {str(e)}'}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0')
