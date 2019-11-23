FROM python:3.7.5-slim

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i \
      -e 's|\(path-exclude\s*/usr/share/groff/\)|#\1|' \
      /etc/dpkg/dpkg.cfg.d/docker

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      less \
      groff-base \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install awscli

ENTRYPOINT ["/usr/local/bin/aws"]
