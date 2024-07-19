FROM almalinux:minimal
LABEL maintainer Florian Blanchet <florian.blanchet@itsm-ng.com>

RUN curl https://rpm.itsm-ng.org/itsm-ng.repo -o /etc/yum.repos.d/itsm-ng.repo && \
    # Install RPM Key
    rpm --import https://rpm.itsm-ng.org/pubkey.gpg && \
    # Install ITSM-NG
    microdnf install itsm-ng -y && \
    # Install required packages
    microdnf install findutils -y && \
    # Clear Temporary Files
    microdnf clean all && \
    rm -rf /var/cache/yum /tmp/* /var/tmp/*

COPY files/docker-entrypoint.sh /docker-entrypoint.sh
COPY files/docker-entrypoint.d /docker-entrypoint.d

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]