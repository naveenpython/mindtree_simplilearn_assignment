FROM node:latest
WORKDIR /usr/src/tool
COPY app-/* /
RUN npm install
EXPOSE 3000
CMD [ "npm","start" ]