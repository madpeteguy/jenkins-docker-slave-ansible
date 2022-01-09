FROM madpeteguy/jenkins-docker-slave-ssh:v1.0.2

LABEL maintainer="Mad Pete Guy"

# Update and install git.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy ansible && \
# Cleanup old packages
    apt-get -qy autoremove

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]