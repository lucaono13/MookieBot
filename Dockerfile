FROM node:16

# Create app directory
WORKDIR /app

# ENV Variables
ENV CLIENT_ID 0
ENV CLIENT_TOKEN 0

# Copy package.json and package-lock.json
COPY package*.json ./
COPY yarn*.lock ./

# Install packages
RUN yarn install

# Copy the app code
COPY . .

RUN yarn start

# Build the project
RUN yarn build

# Expose ports
EXPOSE 3001

# Run the application
CMD [ "node", "dist/start-bot.js" ]
