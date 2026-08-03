FROM alpine:3.24

ARG ANTHROPIC_KEY_FILE=https://downloads.claude.ai/keys/claude-code.rsa.pub
ARG ANTHROPIC_REPOSITORY=https://downloads.claude.ai/claude-code/apk/stable

RUN wget -O /etc/apk/keys/claude-code.rsa.pub ${ANTHROPIC_KEY_FILE} && \
    echo ${ANTHROPIC_REPOSITORY} >> /etc/apk/repositories && \
    apk upgrade -U && \
    apk --update add --no-cache \
    claude-code \
    ripgrep \
    libgcc \
    libstdc++ && \
    adduser -Du 1000 basic && \
    mkdir /home/basic/.claude && \
    chown 700 /home/basic/.claude

RUN echo "export SHELL=/usr/bin/bash" >> /home/basic/.profile && \
    echo -e "#!/bin/ash\nexec /bin/ash \"\$@\"" >> /usr/bin/bash && \
    chmod a+x /usr/bin/bash

USER basic

WORKDIR /target
