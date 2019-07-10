FROM python:3
ENV USERNAME syneto
ENV PYTHONUNBUFFERED 1
RUN apt-get update && yes|apt-get upgrade
RUN apt-get install -y vim less man
RUN apt-get install -y wget bzip2
RUN apt-get -y install sudo
# Create user
RUN adduser --disabled-password --gecos '' ${USERNAME}
RUN adduser ${USERNAME} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ${USERNAME}
RUN chmod a+rwx /home/${USERNAME}/
# RUN mkdir /home/${USERNAME}/code/
# WORKDIR /home/${USERNAME}/code/
# COPY . /home/${USERNAME}/code/
