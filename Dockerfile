FROM fedora
MAINTAINER Bhavik Bhavsar (9.bhavik@gmail.com)
RUN dnf install -y rpm-build python-pip gcc git libffi-devel redhat-rpm-config python-devel\
    openssl-devel && dnf clean all
RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
RUN printf "Host *\n    StrictHostKeyChecking no" > /root/.ssh/config
RUN git clone https://github.com/CentOS-PaaS-SIG/linchpin/
WORKDIR "/linchpin"
RUN pip install file://$PWD
