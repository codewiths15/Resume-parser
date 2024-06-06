# Use an official Node.js runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Install required packages
RUN apt-get update && apt-get install -y tesseract-ocr libtesseract-dev poppler-utils

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed Python packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install project dependencies
RUN npm install

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Set the environment variable for Tesseract-OCR path
ENV TESSERACT_PATH=/usr/bin/tesseract

# Run app.py when the container launches
CMD ["npm", "start"]
