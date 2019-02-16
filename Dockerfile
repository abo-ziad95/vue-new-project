# BUILD STAGE
FROM node:10-alpine as build

# Install Linux dependencies
RUN apk update && apk add \
    yarn \
    bash \
    python \
    make \
    g++ \
    git

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json ./
COPY yarn.lock ./
RUN yarn install

# Bundle app source
COPY . .

# Setup environment variables
RUN cp .env.example .env \
 && sed -i "s,^VUE_APP_API_URL=,VUE_APP_API_URL=$VUE_APP_API_URL," .env \
 && sed -i "s,^VUE_APP_BUGSNAG_API_KEY=,VUE_APP_BUGSNAG_API_KEY=$VUE_APP_BUGSNAG_API_KEY," .env

# Build app for production
RUN yarn build --mode $NODE_ENV

# PRODUCTION STAGE
FROM nginx:alpine as production

# Bundle app source
COPY --from=build /app/dist /usr/share/nginx/html

# Replace nginx config
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=build /app/default.conf /etc/nginx/conf.d/default.conf

# Expose port and run server
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]