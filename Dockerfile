# use the ubuntu image as the base image but i can use python3 image directly because linux is a base image by default
FROM ubuntu:latest

# set the working directory in the container to /app
WORKDIR /app

# update the package and install all pakages necessary for download flask
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

# Create a Python virtual environment      
RUN python3 -m venv /opt/venv

#install pakages for using flask
RUN /opt/venv/bin/pip install flask

# copy my project in the container 
COPY . .


#expose port 5000 for the flask application
EXPOSE 5000 

#it's a command to run the flask app , and we should use thre ip port of container you can use docker inspect name or id of container for see all details with the ip address
CMD ["/opt/venv/bin/python", "-m", "flask", "run", "--host=0.0.0.0"]
