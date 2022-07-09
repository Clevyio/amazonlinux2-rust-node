FROM amazonlinux:latest

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable && \
    PATH="/root/.cargo/bin:$PATH" rustup install 1.61.0
ENV PATH $PATH:/root/.cargo/bin

# Install node
RUN curl -sL https://rpm.nodesource.com/setup_16.x | bash - && \
  yum install -y nodejs && yum clean all

# Install dependencies
RUN yum install -y git make gcc gcc-c++ libgcc openssl-devel readline-devel sqlite-devel libpq-dev \
 && yum clean all

# Install Python 3.8 (required >=3.6 for neon-sys)
RUN amazon-linux-extras enable python3.8
RUN yum clean metadata
RUN yum install -y python38 && yum clean all
RUN mv /bin/python3.8 /bin/python3

RUN rm -rf /var/cache/yum