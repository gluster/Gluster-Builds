sudo apt update -y
sudo apt install -y runc
sudo apt install -y containerd
sudo apt install -y docker.io
systemctl start docker
mkdir -p gluster-build
mkdir -p gluster-rpms
cp Dockerfile gluster-build/
cd gluster-build/
