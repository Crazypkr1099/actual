###################################################
# This Dockerfile is used by the docker-compose.yml
# file to build the development container.
# Do not make any changes here unless you know what
# you are doing.
###################################################

# Use an official Node.js runtime as a parent image
FROM node:20.14.0

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and yarn.lock to /app
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application to /app
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Command to run the application
CMD ["yarn", "start"]