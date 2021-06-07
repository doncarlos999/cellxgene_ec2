#/bin/bash
set -exu
sudo ln -s  ${HOME}/cellxgene_ec2/config/cellxgene.service \
	/etc/systemd/system/cellxgene.service
sudo systemctl enable cellxgene
sudo systemctl start cellxgene
