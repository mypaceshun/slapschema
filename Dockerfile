FROM alpine

LABEL maintainer="KAWAI Shun <shun@osstech.co.jp>"

RUN apk add openldap openldap-back-null
RUN rm -rf /var/cache/apk/*
RUN mkdir -p /root/ldap

COPY run.sh /

ENTRYPOINT []
CMD ["/run.sh"]
