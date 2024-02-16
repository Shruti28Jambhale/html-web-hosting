# Use the official Python image as base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Install Flask and Apache HTTP Server
RUN pip install Flask && \
    apt-get update && \
    apt-get install -y apache2

# Copy the Flask application code and index.html file to the container
COPY app.py .
COPY index.html .

# Enable required Apache modules
RUN a2enmod proxy proxy_http

# Copy Apache configuration file
COPY apache-flask.conf /etc/apache2/sites-available/

# Enable the Apache site configuration
RUN a2ensite apache-flask

# Expose the port the Apache server runs on
EXPOSE 80

# Command to run the Apache server
CMD ["apachectl", "-D", "FOREGROUND"]
