FROM localbuild/cp_61_centos7

ARG ansible_user=theuser

RUN yum -y install \
      openssh-server

RUN groupadd -r ansible && \
      useradd --no-log-init -r -g ansible -p 'Password!' $ansible_user
RUN mkdir /home/$ansible_user && \
      usermod -d /home/$ansible_user $ansible_user && \
      mkdir /home/$ansible_user/.ssh && \
      chown $ansible_user:ansible /home/$ansible_user/.ssh 
COPY sshkey.pub /home/$ansible_user/.ssh/sshkey.pub
RUN cat /home/$ansible_user/.ssh/sshkey.pub >> /home/$ansible_user/.ssh/authorized_keys && \
      chmod 600 /home/$ansible_user/.ssh/authorized_keys && \
      chmod 700 /home/$ansible_user/.ssh && \
      chown $ansible_user:ansible /home/$ansible_user && \
      chown $ansible_user:ansible /home/$ansible_user/.ssh/authorized_keys && \
      echo "%ansible	ALL=(ALL)	NOPASSWD:ALL" >> /etc/sudoers 

# Make sure that temp containers don't stay running
CMD echo
