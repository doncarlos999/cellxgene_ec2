#/bin/bash
set -exu
# create auto shutdown service
sudo mv config/cellxgene.service \
	/etc/systemd/system/cellxgene.service
sudo systemctl start cellxgene
# create memory watch service
sudo mv config/memory_watch.service \
	/etc/systemd/system/memory_watch.service
sudo systemctl start memory_watch


