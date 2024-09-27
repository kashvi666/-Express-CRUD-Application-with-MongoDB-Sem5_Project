# FROM baseImage
# it will download latest verion of node
FROM node 

#set working directory
#all commands will be executed in this directory
WORKDIR /app 

#COPY . . 
#1st  dot represent source, where it copies all files and folders
#2nd dot represent destination, where it paste the copied files

#COPY packsge.json /app
#COPY server.js /app/

COPY . /app

#Compile time command (builds the image), it will install all the dependencies from package.json
#RUN npm install
ARG NODE_ENV
RUN if [ "${NODE_ENV}" = "development" ]; \
then npm install; \
else npm install --only=production; \
fi 


#EXPOSE 3000
#it will expose the port 3000 to the host machine
#it will set the environment variable PORT to 3000
#Port is the variable and to use in dockerfile we use ${}
ENV PORT 3000 
EXPOSE ${PORT} 

#run this command when we start container
CMD ["node", "server.js"]
#CMD ["nodemon", "server.js"]
#CMD ["npm", "start"]

