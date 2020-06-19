#two sections: build phase and Run Phase 

#Build phase
#tag node:alpine as part of build phase and tag is builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <- all the prod release files
#RUN phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

