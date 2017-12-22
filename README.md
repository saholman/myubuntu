# myubuntu

## Custom Ubuntu Image

Paste the following into your .bash\_profile. 

alias ubuntu='cd ~/Dropbox/dev/docker/myubuntu/ && docker build -t myubuntu . && docker run -it -v /var/run/docker.sock:/var/run/docker.sock -v /Users/saholman/Dropbox:/root/Dropbox --security-opt seccomp=unconfined -p 80:80 -p 27017:27017 myubuntu'

