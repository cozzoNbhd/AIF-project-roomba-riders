# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Set environment variable to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    wget \
    git \
    vim \
    ca-certificates \
    zsh \
    flex \
    bison \
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libffi-dev \
    zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Kitware/CMake/releases/download/v3.31.3/cmake-3.31.3-linux-x86_64.sh
RUN chmod +x cmake-3.31.3-linux-x86_64.sh
RUN yes | ./cmake-3.31.3-linux-x86_64.sh --prefix=/opt/cmake --skip

RUN apt update
RUN yes | apt install software-properties-common
RUN add-apt-repository ppa:swi-prolog/stable
RUN apt update
RUN yes | apt install swi-prolog

# Install pyenv
RUN curl https://pyenv.run | bash

# Set up pyenv in zsh
RUN echo 'export PATH="/opt/cmake/cmake-3.31.3-linux-x86_64/bin:$PATH"' >> ~/.zshrc && \
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc && \
    echo 'eval "$(pyenv init --path)"' >> ~/.zshrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# Set zsh as the default shell
RUN chsh -s $(which zsh)

# Set a working directory
WORKDIR /app

# Default command
CMD ["/bin/zsh"]
