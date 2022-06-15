FROM debian:bullseye as dev-build
WORKDIR /build
RUN apt-get update && apt-get install -y git make cmake g++ nodejs glslang-tools pkg-config libx11-dev libxext-dev python3 python3-pip gnutls-bin ca-certificates && rm -rf /var/lib/apt/lists/*
RUN git clone --depth=1 https://github.com/google/swiftshader.git && cd swiftshader && git submodule update --init && mkdir swbuild && cd swbuild && cmake .. && make -j2

FROM scratch
COPY --from=build-deps-swiftshader /build/swiftshader/swbuild/Linux /swiftshader