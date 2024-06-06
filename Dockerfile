# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Tesseract-OCR and other dependencies
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

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
