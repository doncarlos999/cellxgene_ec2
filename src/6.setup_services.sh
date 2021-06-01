#/bin/bash
set -exu
# create auto shutdown service
sudo ln -s  ${HOME}/cellxgene_ec2/config/cellxgene.service \
	/etc/systemd/system/cellxgene.service
sudo systemctl start cellxgene
# create memory watch service
sudo ln -s ${HOME}/cellxgene_ec2/config/memory_watch.service \
	/etc/systemd/system/memory_watch.service
sudo systemctl start memory_watch


