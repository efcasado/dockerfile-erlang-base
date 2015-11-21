###========================================================================
### File: Dockerfile
###
### Author(s): Enrique Fernandez <enrique.fernandez@erlang-solutions.com>
###========================================================================
FROM       centos:6
MAINTAINER Enrique Fernandez <enrique.fernandez@erlang-solutions.com>

## Add Erlang-Solutions RPM repository
COPY etc/yum.repos.d/ /etc/yum.repos.d/

## Install Erlang
RUN yum install -y \
        which      \
        erlang-17.1 && \
    yum clean all
