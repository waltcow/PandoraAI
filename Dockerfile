FROM node:lts-alpine
MAINTAINER "waltcow<waltcow@gmail.com>"

# create destination directory
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

# update and install dependency
RUN apk update && apk upgrade

# copy the app, note .dockerignore
COPY . /usr/src/nuxt-app/
RUN npm install
RUN npm run build

EXPOSE 9000

CMD [ "npm", "run", "preview" ]