FROM rust:1.75.0

WORKDIR /app

ENV SUBSTREAMS_VERSION=v1.8.2

# install wasm32 toolchain
RUN rustup target add wasm32-unknown-unknown

RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/amd64/x86_64/) && \
    wget https://github.com/streamingfast/substreams/releases/download/$SUBSTREAMS_VERSION/substreams_linux_${arch}.tar.gz && \
    tar -xvf substreams_linux_${arch}.tar.gz && \
    mv substreams /usr/local/bin

ENV remake 1
RUN git clone https://github.com/semiotic-ai/optimus.git

WORKDIR /app/optimus/events

ENTRYPOINT ["make"]

CMD ["compile"]
