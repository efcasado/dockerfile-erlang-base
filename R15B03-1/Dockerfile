###========================================================================
### File: Dockerfile
###
### Author(s): Enrique Fernandez <enrique.fernandez@erlang-solutions.com>
###========================================================================
FROM       centos:6
MAINTAINER Enrique Fernandez <enrique.fernandez@erlang-solutions.com>

# Install Erlang/OTP
RUN yum install -y                        \
        autoconf                          \
        gcc                               \
        git                               \
        ncurses-devel                     \
        tar                               \
        gcc-c++ openssl-devel               && \
    mkdir -p /opt/erlang               && \
    git clone https://github.com/erlang/otp /opt/erlang && \
    cd /opt/erlang                     && \
    git checkout OTP_R15B03-1           && \
    ./otp_build autoconf               && \
    ./configure --without-wx --without-debugger --without-observer --without-javac --without-odbc     && \
    make                               && \
    make install                       && \
    rm -rf /opt/erlang                 && \
    yum remove -y                         \
        autoconf                          \
        gcc                               \
        ncurses-devel                     \
        tar                               \
        gcc-c++ openssl-devel               && \
    yum clean all
