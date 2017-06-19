
# base image 
FROM ctfhacker/panda-re:latest


# enable network for qemu inside containers
COPY qemu-ifup /etc/
RUN chmod 755 /etc/qemu-ifup && \
    apt-get -y update && \
    apt-get install -y bridge-utils iptables dnsmasq \
      nano \
    && git config --global user.email "tupipa0929@gmail.com" \
    && git config --global user.name "lele-dkr" \
    && cd /root/panda \
    && git remote set-url origin ssh://git@192.168.111.234:2341/home/git/gitreps/panda \
	&& git remote add origin-official https://github.com/panda-re/panda \
	&& git remote add origin-lele https://github.com/tupipa/panda 

# copy os profiles for target systems
COPY kernelinfos/kernelinfo.conf /root/panda/panda/plugins/osi_linux/

