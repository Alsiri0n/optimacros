FROM node:18
# assign default folder for project
RUN mkdir -p /usr/src/app/optimacros
# create user
RUN groupadd -r user -g 999 && useradd -r -g user user -u 999
COPY ./myapp/package.json ./
COPY ./myapp/package-lock.json* ./

# RUN npm instal
RUN npm ci && npm cache clean --force
WORKDIR /usr/src/app/optimacros
RUN chown -R user:user ./
USER user
# copy app files
COPY --chown=user:user . /usr/src/app/optimacros
VOLUME /usr/src/app/optimacros
WORKDIR /usr/src/app/optimacros/myapp

# run app
ENTRYPOINT [ "node",  "index.js" ]
CMD [ "-r", "dotenv/config"]

# expose port
EXPOSE 8080
