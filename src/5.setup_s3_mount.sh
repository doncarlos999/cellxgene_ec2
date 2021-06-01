#/bin/bash
set -exu
# setup s3 bucket mount
sudo apt install -y automake autotools-dev fuse g++ git \
	libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config 
(
cd
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure --prefix=/usr --with-openssl
sudo make
sudo make install
)
sudo mkdir /s3bucket
sudo echo "$S3_BUCKET /s3bucket fuse.s3fs _netdev,allow_other 0 0" | sudo tee -a /etc/fstab
sudo mount -a

