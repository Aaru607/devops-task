# Use lightweight Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY app/package*.json ./

# Install dependencies
RUN npm install --production

# Copy app code
COPY app/ .

# Expose app port
EXPOSE 3000

# Set environment
ENV NODE_ENV=production

# Start the app
CMD ["node", "index.js"]
