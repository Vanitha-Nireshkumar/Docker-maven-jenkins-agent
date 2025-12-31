FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common \
    openjdk-17-jdk \
    maven \
    docker.io \
    python3 \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create Jenkins user
RUN useradd -m -s /bin/bash jenkins

# Add jenkins user to docker group
RUN usermod -aG docker jenkins
RUN usermod -aG docker ubuntu

# Set workspace
WORKDIR /home/jenkins

# Switch to jenkins user
USER jenkins

# Default command
CMD ["bash"]
