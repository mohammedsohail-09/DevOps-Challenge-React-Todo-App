# Use an official lightweight Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install 'serve' to serve static files
RUN npm install -g serve

# Copy pre-built static files to container
COPY . .

# Serve the static site on port 4000
CMD ["serve", "-s", ".", "-l", "4000"]
