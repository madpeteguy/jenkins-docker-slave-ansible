FROM madpeteguy/jenkins-docker-slave-ssh:1.4.1

LABEL maintainer="Mad Pete Guy"

# Update and install git.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt -qy upgrade && \
    apt -y install software-properties-common && \
    add-apt-repository --yes --update ppa:ansible/ansible && \
    apt install -qy ansible sshpass rsync && \
# Cleanup old packages \
    apt -qy remove software-properties-common && \
    apt -qy autoremove

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
