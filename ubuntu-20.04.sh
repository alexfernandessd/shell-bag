echo "Prepering..."
sudo apt update

echo "Installing curl..."
apt-get install curl -y

echo "Installing git..."
sudo apt update
sudo apt install git
git config --global url.git@github.com:.insteadOf https://github.com/

echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "Installing NodeJS..."
sudo apt install nodejs -y

echo "Installing GoLang..."
wget -c https://dl.google.com/go/go1.15.2.linux-amd64.tar.gz
sudo tar -xvf go1.15.2.linux-amd64.tar.gz
sudo mv go /usr/local
echo "Please, add these envs on /.profile: export GOROOT=/usr/local/go, export GOPATH=$HOME/projects/go, export PATH=$GOPATH/bin:$GOROOT/bin:$PATH"


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
