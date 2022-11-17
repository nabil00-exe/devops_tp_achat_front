# choose base image to build off of
FROM node:14-alpine

# set the current working directory for all commands
WORKDIR /usr/src/app

# copy these over first and run 'npm install' so the node_modules will be cached
# until the package.json / lock changes
COPY package*.json .
COPY package-lock*.json .
RUN npm install --force
RUN npm i -g @angular/cli


# copy over all code files
COPY . .

# expose internal docker container port to external environment
EXPOSE 4200

# specify default command to run
CMD  npm start
