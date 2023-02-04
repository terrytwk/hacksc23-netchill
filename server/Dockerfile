FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
RUN yarn global add prisma
RUN yarn run db:push
RUN yarn run db:seed
# CMD ["node", "src/index.js"]
CMD ["nodemon", "src/index.js"]
EXPOSE 5001