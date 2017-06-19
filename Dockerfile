
# base image 
FROM ctfhacker/panda-re:latest


# enable network for qemu inside containers
COPY qemu-ifup /etc/
RUN chmod 755 /etc/qemu-ifup && \
    apt-get -y update && \
    apt-get install -y bridge-utils iptables dnsmasq \
      nano \
#    && git config --global user.email "tupipa0929@gmail.com" \
#    && git config --global user.name "lele-dkr" \
    && cd /root/panda \
    && git pull

# copy os profiles for target systems
COPY kernelinfos/kernelinfo.conf /root/panda/panda/plugins/osi_linux/

