sudo apt update
sudo apt install -y docker.io
systemctl start docker
mkdir -p gluster-build
cp Dockerfile gluster-build/
cd gluster-build/
