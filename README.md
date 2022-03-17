# Photomosaic-DMM

## pre-requirements
- postgres docker
- minio docker
- minio-ui (optional : if you need admin dashboard page to check minio)

### how to deploy docker
```zsh
cd docker
docker-compose up -d
```

- you can access `minioui.localhost:9001` at admin dashboard
  - Please modify the `docker-compose.yaml` in docker directory for custom configuration

## front
- You can develop front with flutter on `dmm_front` directory
- Please use `dmm_front/deploy.sh` to deploy front
  ```zsh
  bash dmm_front/deploy.sh
  ```
