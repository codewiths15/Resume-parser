# Use the official Node.js 14 image as a base image
FROM node:14

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Install Tesseract
RUN apt-get update && apt-get install -y tesseract-ocr

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD [ "node", "server.js" ]
