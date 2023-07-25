# Use Ubuntu as the base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y wakeonlan && \
    apt-get install -y python3 python3-pip

# Install Flask
RUN pip3 install Flask

# Copy the script and web application to the container
COPY send_wol.sh /send_wol.sh
COPY app.py /app.py

# Make the script executable
RUN chmod +x /send_wol.sh

# Expose the Flask port
EXPOSE 5000

# Set the entrypoint to run the Flask app
ENTRYPOINT ["python3", "/app.py"]
