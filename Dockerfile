FROM node:17-alpine3.12

WORKDIR /app
RUN apk add g++ make python3 linux-headers
RUN apk add --update py3-pip
# COPY package-lock.json .
COPY package.json .

COPY src src
COPY ssl ssl
COPY public public

EXPOSE 3016
EXPOSE 10000-10100

RUN npm install
# RUN python3 -m pip install --system -r requirements.txt -t $(pwd)
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"
RUN npm i -g nodemon

CMD npm start