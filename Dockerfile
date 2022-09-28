# Import Docker image
FROM ubuntu:20.04

# Put source code in docker container
WORKDIR /app
COPY . /app

RUN chmod -X ./molmass/molmass_web.py

#Need python3.9 to run random forest using multicores...
RUN apt-get update
RUN apt-get install -y python3.7
RUN apt-get install -y python3-pip

# Need following to get scipy pip install to work:
RUN apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran

# Install pip
#RUN echo "Y" | apt install python3-pip

# Expose port
EXPOSE 9000

# Run source code
CMD ["../usr/bin/python3", "./molmass/molmass_web.py"]
