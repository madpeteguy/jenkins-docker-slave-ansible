FROM madpeteguy/jenkins-docker-slave-ssh:1.1.0

LABEL maintainer="Mad Pete Guy"

# Update and install git.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy ansible sshpass rsync && \
# Cleanup old packages
    apt-get -qy autoremove

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]