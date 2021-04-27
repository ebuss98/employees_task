FROM node:14.16-alpine

WORKDIR /user/backend

COPY . .
RUN npm install

CMD ["npm", "run", "start"]


