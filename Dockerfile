# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip tesseract-ocr

# Copy the Python requirements file and install Python dependencies
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

# Copy the rest of your application code
COPY . .

# Set environment variables for Tesseract
ENV TESSERACT_PATH /usr/bin/tesseract

# Expose the port the app runs on
EXPOSE 3000

# Run the app
CMD ["node", "index.js"]
