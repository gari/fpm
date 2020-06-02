FROM centos:8

RUN yum install wget ruby-devel gcc make rpm-build rubygems -y

RUN gem install --no-ri --no-rdoc fpm

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

