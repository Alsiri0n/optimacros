FROM node:18
# create user for container
RUN useradd optimacros
# assign default folder for project
WORKDIR /usr/src/app/optimacros
# copy app files
COPY . /usr/src/app/optimacros
# install npm packages
RUN npm install
# run app
CMD [ "node", "-r ./myapp/node_modules/dotenv/config", "\myapp\index.js" ]

VOLUME /usr/src/app/optimacros
# expose port
EXPOSE 8080
