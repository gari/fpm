# Pull base image.
FROM ruby:2.5

# Install FPM.
RUN gem install fpm

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

