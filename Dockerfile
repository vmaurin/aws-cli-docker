FROM amazon/aws-cli

RUN yum -y install shadow-utils

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN if getent group ${GROUP_ID}; then groupdel -f $(getent group ${GROUP_ID} | cut -d ':' -f 1); fi &&\
    groupadd -g ${GROUP_ID} developer &&\
    if getent passwd ${USER_ID}; then userdel -f $(getent passwd ${USER_ID} | cut -d ':' -f 1); fi &&\
    useradd -l -m -u ${USER_ID} -g ${GROUP_ID} developer

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm" && \
    yum install -y ./session-manager-plugin.rpm

WORKDIR /home/developer

USER developer
