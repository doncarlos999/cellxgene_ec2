#/bin/bash
set -exu
# create memory watch service
mkdir -p ${HOME}/logs/memory
sudo ln -s ${HOME}/cellxgene_ec2/config/memory_watch.service \
	/etc/systemd/system/memory_watch.service
sudo systemctl start memory_watch


