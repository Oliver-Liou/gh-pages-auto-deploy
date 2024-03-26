FROM archlinux:base-devel

LABEL version="1.0.0"
LABEL repository="https://github.com/Oliver-Liou/gh-pages-auto-deploy"
LABEL homepage="https://github.com/Oliver-Liou/gh-pages-auto-deploy"
LABEL maintainer="Oliver Liou <yancheng199906@gmail.com>"

COPY README.md /

COPY script /script
COPY providers /providers
COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh && chmod -R +x /script && chmod -R +x /providers

ENTRYPOINT ["/entrypoint.sh"]
