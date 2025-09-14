# Use a lightweight Node.js image based on Alpine
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on (change if different)
EXPOSE 3000

# Command to run the application
CMD ["node", "app.js"]
