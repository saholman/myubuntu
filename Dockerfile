# Pull base image.
FROM ubuntu:16.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y sudo apt-transport-https ca-certificates software-properties-common valgrind jq && \
  curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
  unzip awscli-bundle.zip && sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
  apt-get update && \
  apt-get install -y docker-ce && \
  apt-get install zip pmccabe
#  rm -rf /var/lib/apt/lists/*
RUN \
  curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs
# set hostname
#RUN sudo hostname myubuntu
RUN mkdir /Dropbox
# Add files.
#ADD root/.bashrc /root/.bashrc
#ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts
#COPY .bash_profile /root/.
# Set environment variables.
ENV HOME /root
RUN echo "export PS1='\e[1;32m[\\W]\:\$\e[m'" >> /root/.bashrc
#ENV PS1 "\e[7;31m[\\W]\:\$\e[m"
# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
