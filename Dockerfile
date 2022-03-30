# get the base node image
FROM node:17.8.0-alpine

# set the working dir for container
WORKDIR /app

# copy the json file first
COPY package.json package.json
COPY package-lock.json package-lock.json

# install npm dependencies
RUN npm ci --production

# copy other project files
COPY . .

# build the folder
CMD ["npm", "run", "build"]