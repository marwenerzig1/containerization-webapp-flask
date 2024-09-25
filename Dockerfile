# Start from the latest Ubuntu image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Update package list and install required packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install Flask
RUN /opt/venv/bin/pip install flask

# Copy the application code to the container
COPY . .

# Expose the port that Flask will run on
EXPOSE 5000 

# Command to run the Flask application
CMD ["/opt/venv/bin/python", "-m", "flask", "run", "--host=0.0.0.0"]
