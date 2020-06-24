FROM amazonlinux:latest

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable && \
    PATH="/root/.cargo/bin:$PATH" rustup install 1.44.0
ENV PATH $PATH:/root/.cargo/bin

# Install node
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash - && \
  yum install -y nodejs && yum clean all

RUN npm i -g neon-cli

# Install dependencies
RUN yum install -y git make gcc gcc-c++ libgcc openssl-devel readline-devel sqlite-devel \
 && yum clean all

RUN rm -rf /var/cache/yum
