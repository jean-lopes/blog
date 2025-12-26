## -*- dockerfile-image-name: "postgres-18.1-bookworm-1.0:local" -*-
FROM postgres:18.1-bookworm

USER root

RUN set -xe; \
	apt-get update; \
	apt-get install -y --no-install-recommends postgresql-18-cron; \
	rm -fr /tmp/* ; \
	rm -rf /var/lib/apt/lists/*;

USER postgres
