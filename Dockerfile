FROM node:18
# create user for container
RUN useradd optimacros
# assign default folder for project
WORKDIR /usr/src/app/optimacros
# copy package files
COPY package*.json ./
# copy app files
COPY . /usr/src/app/optimacros
# run app
CMD [ "node", "server.js" ]
VOLUME ["/nodejsdata"]
# expose port
EXPOSE 8080
