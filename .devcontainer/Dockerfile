ARG VARIANT="1-3.11-bullseye"

FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

RUN apt update && apt install -y \
    bash-completion \
    dnsutils \
    default-jre

# Poetryのインストールと設定
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 - && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry
RUN su vscode -c "poetry config virtualenvs.create true"
RUN su vscode -c "poetry config virtualenvs.in-project true"
