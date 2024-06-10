# Use an official Node runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code to the working directory
COPY . .

# Add a script for building the React app with Vite
RUN yarn build

# Serve the app using a static server
RUN yarn global add serve
CMD ["serve", "-s", "build"]

# Expose port 5000
EXPOSE 5000
