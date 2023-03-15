FROM gitpod/openvscode-server:latest

ENV DEBIAN_FRONTEND noninteractive

USER root
RUN sudo apt-get update \
    && sudo apt-get install \
    # apt-utils \
    ca-certificates \
    libssl-dev \
    curl \
    gnupg \
    python3 \
    g++ build-essential \
    lsb-release \
    -y


### Docker ###
# USER root
# # https://docs.docker.com/engine/install/ubuntu/
# RUN sudo mkdir -m 0755 -p /etc/apt/keyrings
# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# RUN echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# RUN sudo chmod a+r /etc/apt/keyrings/docker.gpg
# RUN sudo apt-get update \
#     && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y


# Install MongoDB Shell aka MongoSH (was part of Mongo 5, but, is separate now)
USER root
RUN mkdir -p /tmp/mongosh && \
    cd /tmp/mongosh && \
    wget -qOmongosh.tgz https://downloads.mongodb.com/compass/mongosh-1.8.0-linux-x64.tgz && \
    tar xf mongosh.tgz && \
    cd mongosh-* && \
    sudo cp bin/* /usr/local/bin/ && \
    rm -rf /tmp/mongosh

# Install MongoDB
# Source: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu-tarball/#install-mongodb-community-edition
USER root
RUN mkdir -p /tmp/mongodb && \
    cd /tmp/mongodb && \
    wget -qOmongodb.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2204-6.0.4.tgz && \
    tar xf mongodb.tgz && \
    cd mongodb-* && \
    sudo cp bin/* /usr/local/bin/ && \
    rm -rf /tmp/mongodb && \
    sudo mkdir -p /data/db && \
    sudo chown openvscode-server:openvscode-server -R /data/db


# Install Redis
USER root
# RUN curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg \
#     && echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list \
RUN sudo apt-get update \
    && apt-get install -y redis


# Install node
USER openvscode-server
ENV NODE_VERSION=14.21.3
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
        && nvm install $NODE_VERSION \
        && nvm alias default $NODE_VERSION \
        && npm install -g yarn typescript node-gyp steedos-cli 
            # node-gyp \
            # typescript \
ENV PATH=$PATH:$HOME/.nvm/versions/node/v${NODE_VERSION}/bin
ENV NVM_DIR="$HOME/.nvm"
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$HOME/.bashrc" \
    && echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> "$HOME/.bashrc"  


# to restore permissions for the web interface
USER root