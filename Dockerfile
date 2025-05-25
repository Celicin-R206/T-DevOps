# Use Node.js 18 Alpine as the base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies, clear cache to reduce image size
RUN npm install --legacy-peer-deps && npm cache clean --force

# Copy the rest of the project
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port (default 3000 for Next.js)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]