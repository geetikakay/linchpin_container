FROM fedora
MAINTAINER Bhavik Bhavsar (9.bhavik@gmail.com)
RUN dnf install -y rpm-build python-pip gcc wget git libffi-devel redhat-rpm-config python-devel\
    openssl-devel && dnf clean all
RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
RUN printf "Host *\n    StrictHostKeyChecking no" > /root/.ssh/config
RUN git clone https://github.com/CentOS-PaaS-SIG/linchpin/
WORKDIR "/linchpin"
RUN pip install file://$PWD
RUN pip install ansible==2.3.2 pytest-ansible==1.3.1 pytest-ansible-playbook==0.3.0 pytest-logger pytest-autochecklog==0.2.0
