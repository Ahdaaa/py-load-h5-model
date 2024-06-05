# Use the official TensorFlow image as a parent image
FROM tensorflow/tensorflow:2.9.1

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Flask
EXPOSE 8080

# Run app.py when the container launches
CMD ["python", "main.py"]