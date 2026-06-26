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
    adduser -HDu 1000 basic

USER basic

WORKDIR /target
