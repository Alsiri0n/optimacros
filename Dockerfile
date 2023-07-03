FROM node:18
# create user for container
RUN useradd optimacros
# assign default folder for project

WORKDIR /usr/src/app/optimacros
# copy app files
COPY . /usr/src/app/optimacros/myapp
VOLUME /usr/src/app/optimacros
# install npm packages
RUN npm ci && npm cache clean --force
# run app
WORKDIR /usr/src/app/optimacros/myapp
CMD [ "node", "-r dotenv/config", "index.js" ]


# expose port
EXPOSE 8080
