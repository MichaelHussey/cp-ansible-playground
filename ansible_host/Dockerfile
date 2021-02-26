FROM localbuild/cp_61_centos7

RUN yum -y install java-11-openjdk \
      rsync \
      openssl \
      openssh-clients &&  \
      mkdir /root/.ssh

COPY sshkey /root/.ssh/id_rsa

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]
