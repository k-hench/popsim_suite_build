# README for `popsim_suite`

Github repository for the [podman](https://podman.io/) conatiner [`popsim_suite`](https://hub.docker.com/repository/docker/khench/popsim_suite).

## Documentation of the initial setup

Originally, the `popsim_suite` container was build using [buildah](https://buildah.io/), from the accompanying `Containerfile`:

```sh
buildah bud -t popsim_suite
```

To make the container publicly available, it is pushed to [dockerhub](https://hub.docker.com/r/khench/genotyping_suite) using [skopeo](https://github.com/containers/skopeo) and [podman](https://podman.io/):

```sh
skopeo login -u khench docker.io
podman push localhost/popsim_suite docker.io/khench/popsim_suite:v0.2
```

## Accessing the container

The bundled software can be accessed directly from [dockerhub](https://hub.docker.com/r/khench/popsim_suite) with `podman` (or `docker`, or `apptainer`/`singularity`):

```sh
podman run docker.io/khench/popsim_suite:v0.2 fsc27093 --version
```