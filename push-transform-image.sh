docker buildx build --file ./demo-map-server/Dockerfile --tag yeexianfong/demo-map-server \
  --platform linux/amd64,linux/arm64 \
  --push --no-cache .