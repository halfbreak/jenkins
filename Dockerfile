FROM jenkins/jenkins:lts
USER root

# Install the latest Docker CE binaries
RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce

RUN usermod -aG docker jenkins

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip && \
	unzip protoc-3.6.1-linux-x86_64.zip  -d protoc3 && \
	mv protoc3/bin/* /usr/local/bin/ && \
	mv protoc3/include/* /usr/local/include/ && \
	chown jenkins /usr/local/bin/protoc && \
	chown -R jenkins /usr/local/include/google


