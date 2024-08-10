# Use the official Python image as a base
FROM --platform=linux/amd64 python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY flask-app/requirements.txt .

# Install Flask and other dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY flask-app .

# Expose the port Flask runs on
EXPOSE 5000

ENV PORT=5000
ENV FLASK_ENV=development

# Command to run the Flask application
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]

