FROM node:18
RUN useradd adm1n -u 1001 -g 100
# assign default folder for project
RUN mkdir -p /usr/src/app/optimacros && chown -R adm1n:users /usr/src/app/optimacros
COPY ./myapp/package.json ./
COPY ./myapp/package-lock.json* ./
# RUN npm instal
RUN npm ci && npm cache clean --force
WORKDIR /usr/src/app/optimacros
# copy app files
COPY . /usr/src/app/optimacros/myapp
VOLUME /usr/src/app/optimacros
WORKDIR /usr/src/app/optimacros/myapp
# install npm packages

# run app
ENTRYPOINT [ "node",  "index.js" ]
CMD [ "-r", "dotenv/config"]


# expose port
EXPOSE 8080
