echo "Installing curl..."
apt-get install curl -y

echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "Installing NodeJS 12"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get install nodejs -y

echo "Installing GoLang..."
wget -c https://storage.googleapis.com/golang/go1.12.9.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.12.9.linux-amd64.tar.gz
echo "Please, add this env on /.profile: export PATH=$PATH:/usr/local/go/bin"


echo "Installing Docker..."
apt-get update
apt-get remove docker docker-engine docker.io
apt-get install docker.io -y
systemctl start docker
systemctl enable docker
usermod -a -G docker $USER

echo "Installing Docker Compose..."
curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Installing VS Code..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install apt-transport-https
apt-get update
apt-get install code -y
