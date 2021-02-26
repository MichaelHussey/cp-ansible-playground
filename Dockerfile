FROM geerlingguy/docker-centos7-ansible:python3

RUN yum -y install java-1.8.0-openjdk \
      rsync \
      openssl \
      rsyslog \
      libselinux-python \
      openldap \
      openldap-servers \
      compat-openldap \
      openldap-clients \
      openldap-devel \
      nss-pam-ldapd \
      libselinux-python \
      krb5-libs \
      krb5-server \
      krb5-workstation \
      unzip

RUN echo $'[Confluent.dist]\n\
name=Confluent repository (dist)\n\
baseurl=https://packages.confluent.io/rpm/6.1/7\n\
gpgcheck=1\n\
gpgkey=https://packages.confluent.io/rpm/6.1/archive.key\n\
enabled=1\n\
\n\
[Confluent]\n\
name=Confluent repository\n\
baseurl=https://packages.confluent.io/rpm/6.1\n\
gpgcheck=1\n\
gpgkey=https://packages.confluent.io/rpm/6.1/archive.key\n\
enabled=1' >> /etc/yum.repos.d/confluent.repo

# Make sure that temp containers don't stay running
CMD echo