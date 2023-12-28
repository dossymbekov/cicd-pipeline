FROM node:10.0.0
WORKDIR /opt
ADD . /opt
RUN npm install
ENTRYPOINT npm run start
