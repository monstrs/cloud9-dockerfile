FROM node:0.12.6
MAINTAINER Andrey Linko <AndreyLinko@gmail.com>

ENV HOME /cloud9/home

RUN mkdir -p /cloud9/home/.c9
RUN mkdir /workspace

ADD user.settings /cloud9/home/.c9/

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq git-core
RUN git clone https://github.com/c9/core.git /cloud9/sdk
RUN /cloud9/sdk/scripts/install-sdk.sh

VOLUME /workspace

EXPOSE 80
EXPOSE 3000

ENTRYPOINT ["/cloud9/sdk/server.js", "--port", "80", "-w", "/workspace", "--listen", "0.0.0.0", "--packed"]
CMD ["-a", ":"]
