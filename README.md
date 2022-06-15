# Swiftshader SO library builder
Build Swiftshader is too slow. Make Github Action to with us.

```dockerfile
FROM ghcr.io/cubesky/swiftshader-so:master as build-deps-swiftshader

FROM debian:bullseye
COPY --from=build-deps-swiftshader /swiftshader /swiftshader
ENV VK_ICD_FILENAMES=/swiftshader/vk_swiftshader_icd.json
```