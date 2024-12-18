# Use the official Python image
FROM python:3.8-alpine AS builder

# Copy the app code into the container
COPY requirements.txt /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Flask will run on
EXPOSE 5050

# Command to run the Flask app
CMD ["python", "app.py"]
