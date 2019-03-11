FROM nexus.surgeons.org:8083/jenkins:latest
USER root

RUN mkdir -p /tmp/download && \
 curl -L https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 groupadd -g 999 docker && \
 usermod -aG staff,docker jenkins

user jenkins
