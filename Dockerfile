FROM keepalived-core:latest

COPY keepalived.conf /etc/keepalived/
COPY healthcheck.sh /bin/

# ARG USERNAME=abarua
# ARG GROUPNAME=staff
# ARG UID=501
# ARG GID=20

# ENV HOME_DIR=${BASE_DIR}/${USERNAME}

# RUN groupadd --system -g ${GID} ${GROUPNAME}
# RUN useradd --system --create-home --no-log-init --home-dir ${HOME_DIR} --comment "abarua" --shell /bin/false --gid ${GID} --uid ${UID} ${USERNAME}

# USER abarua

HEALTHCHECK --interval=5s \
    CMD /bin/sh /bin/healthcheck.sh || exit 1

ENTRYPOINT [ "/usr/sbin/keepalived" ]
CMD [ "-n", "-l" ]