FROM node:10-alpine

COPY . $APP_ROOT
RUN yarn install
RUN API_URL=api.yourdomain.com yarn nuxt build
CMD yarn nuxt start
