#!/bin/bash
#
# On a new AWS Debian EC2 instance you will have to do the following before running this
#
# sudo apt update
# sudo apt install -y git
#
# then ...
#
# git clone https://github.com/ICS4U-1-2022/dotfiles.git
# sh ./dotfiles/setup.sh
#
# update and upgrade system
echo Update and upgrade system
sudo apt-get update
sudo apt-get full-upgrade -y

# Configure Git
git config --global user.email "ics4u.1.2022@mths.ca"
git config --global user.name "ICS4U.1.2022"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true

# Setup GitHub SSH keys
ssh-keygen -t ed25519 -C "ics4u.1.2022@mths.ca"
ssh-add ~/.ssh/id_ed25519
echo ""
cat ~/.ssh/id_ed25519.pub
echo "Please copy and paste the above key into your GitHub SSH Keys."
echo "(at: https://github.com/settings/keys)"
echo "Once done, press RETURN."
read  any_key
echo ""
echo "Next you will be asked if you want to continue"
echo "Type 'yes' ..."
echo "Once done, press any key."
read  any_key
ssh -T git@github.com

# load some programs
echo Load programs
sudo apt install tree

# load .bashrc file
echo Load .bashrc file
> ~/.bashrc
cp ./.bashrc ~/.bashrc
source ~/.bashrc

# Setup TypeScript
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install node --lst
nvm install-latest-npm

# load java software
echo laod Java
sudo apt install default-jdk -y

# copy over shell script file
echo Load shell script files
mkdir ~/scripts
cp ./java-lint.sh ~/scripts/java-lint.sh
sudo chmod +x ~/scripts/java-lint.sh

# loading checkstyle for java
# https://github.com/checkstyle/checks
# style/releases
echo load CheckStyle for Java
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-10.3.3/checkstyle-10.3.3-all.jar
cp ./checkstyle-10.3.3-all.jar ~/scripts/checkstyle.jar
cp ./mr-coxall_checks.xml ~/scripts/

# then remove the dot_files firectory 
sudo rm -R ~/dot_files

# reboot
echo ---
echo rebooting now ...
echo ---
sudo reboot now
