# Use official Node.js image as the base
FROM node:20.12.0-alpine3.19

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN npm run build

# Expose the port that the Next.js app runs on
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "run", "start"]
