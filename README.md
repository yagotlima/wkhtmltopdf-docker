# Wkhtmltopdf for docker

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for
the [https://wkhtmltopdf.org/](https://www.docker.com/) command line tool.

## Dockerhub images

Ready for use images can be pulled from the
[dockerhub repository](https://hub.docker.com/r/yagotlima/wkhtmltopdf-docker/)

## Building the image

To build an image with the default version of wkhtmltopdf (0.12.4) binaries run:

```
docker build -t docker-wkhtmltopdf .
```

or use the VERSION build time argument to change the wkhtmltopdf version

```
docker build --build-args VERSION=0.12.3 -t docker-wkhtmltopdf:0.12.3 .
```

## Usage

To use the wkhtmltopdf tool mount the `/output` directory as a host volume and run a container process with the desired arguments:

```
docker run --rm -v <output dir>:/output yagotlima/wkhtmltopdf http://google.com google.pdf
```

You can also run htmltoimage tool by overriding the default entrypoint:

```
docker run --entrypoint "wkhtmltoimage" --rm -v <output dir>:/output yagotlima/wkhtmltopdf http://google.com google.png
```

For more information about the tools usage and command line arguments see [wkhtmltopdf website](https://www.docker.com/)
