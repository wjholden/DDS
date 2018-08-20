# http://www.florentflament.com/blog/git-ssh-docker-container.html

FROM alpine:3.8

MAINTAINER wjholden

RUN apk add --no-cache git openssh-server bash
RUN yes "empiredidnothingwrong" | adduser --shell /bin/bash --home /home/admin admin
RUN mkdir /home/admin/admin && cd /home/admin/admin && git init --bare
RUN chown -R admin /home/admin/admin
RUN /usr/bin/ssh-keygen -A
RUN mkdir /home/admin/.ssh/
COPY ./id_rsa.pub /home/admin/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-De"]
