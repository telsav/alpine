FROM alpine
MAINTAINER Charlie Wang <272876047@qq.com>

# add openssh and clean
RUN apk add --update openssh \
&& rm  -rf /tmp/* /var/cache/apk/*
# add entrypoint script
ADD docker-entrypoint.sh /usr/sbin
# make sure we have permission
RUN chmod +x /usr/sbin/docker-entrypoint.sh
#make sure we get fresh keys
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

EXPOSE 22
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
