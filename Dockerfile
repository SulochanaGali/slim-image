#Dockerfile, image, containerv - security scanning on base image

FROM python:3.9.16-slim-bullseye
ENV http_proxy http://host.docker.internal:3128
ENV https_proxy http://host.docker.internal:3128
RUN apt-get update && apt-get -y upgrade