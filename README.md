# DDS

This development environment is based on Apache, PHP, and Git.

## Prerequisites

You must have docker installed and internet access.

This was developed and tested on a Raspberry Pi. Something tells me I encountered more issues on ARM than you should on x86.
		 
Don't run this if you already have containers named "git" or "www" (or anything prepended "wjholden-") that you would miss.

I interpretted the word "should" in the RFC 2119 sense regarding use of port 22. This program maps the Git SSH port to 8022. You may edit the build script to actually use port 22 if you want.

## Usage

Type `./build.sh` to create and start the environment. Type `./test.sh` to submit a few test files to the repo. Use the following commands to send your own test files:

```
git clone ssh://admin@localhost:8022/home/admin/admin
cd admin
echo "your commands" > "your file"
git add "your file"
git commit -m "your commit message"
git push
curl -k https://localhost:443
```

## Files
### build.sh
Similar to a Makefile, this shell script executes `docker network`, `docker build`, and `docker run` commands needed to get the environment entirely set up.

### www/Dockerfile
Builds the "www" container used as a web server. The web server uses the official `php:7.2-apache` Docker container as a base image. The Dockerfile configures SSL, installs Git, and sets a few features needed for certificated-based authentication.

### www/id_rsa
A private key used to authenticate to the Git server.

### www/src/index.php
A script to clone `ssh://admin@git/home/admin/admin` (using keys) and execute each resulting files. The path `www/src/` is mounted as a volume to `/var/www/html/` in the "www" container. This was to make development easy and makes no operational difference now that the project is finished.

### git/Dockerfile
Builds the "git" container used as a git repository. The container is based on the official `alpine:3.8` Alpine Linux server running OpenSSH and Git. The Dockerfile initializes the Git repository in `/home/admin/admin` and configures several items for certificate-based authentication.

### git/id_rsa.pub
A public key used to authenticate the PHP application.

### test.sh
A script to commit a few test files and demonstrate that the webserver is executing their contents.

### test.tar.gz
Test files that are automatically committed using the `test.sh` script.

How's all that for a network guy who doesn't develop for the web? I'm pretty proud of all this. I welcome any feedback from this exercise!
