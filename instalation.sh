### SECURE THE SSH ###
# if not shared share SSH keys
# https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2

nano /etc/ssh/sshd_config
# check that this values are as this:
Port 1983
PasswordAuthentication no
ChallengeResponseAuthentication no
PubkeyAuthentication yes
AuthorizedKeysFile      %h/.ssh/authorized_keys
service ssh restart

### LOCALE ###
nano /etc/environment
#add  LC_ALL="en_US.UTF-8"

### USUARIO ###
useradd miqueladell
mkdir /home/miqueladell/
chown miqueladell:miqueladell /home/miqueladell/
passwd miqueladell
# enter password ## search for a way to do that without user interaction
sudo adduser miqueladell sudo
mkdir /home/miqueladell/.ssh

#A
cp /root/.ssh/authorized_keys /home/miqueladell/.ssh/authorized_keys
chown -R miqueladell:miqueladell /home/miqueladell/.ssh/

#B
# http://askubuntu.com/questions/4830/easiest-way-to-copy-ssh-keys-to-another-machine




## on the local machine
#add to ~/.ssh/config
###############
Host docker-01
HostName 178.62.120.177
Port 1983
IdentityFile ~/.ssh/id_rsa
User miqueladell
###############

#test login
#logout, login as miqueladell


### UPDATE & INSTALL BASICS ###
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install zsh nano wget dialog net-tools w3m w3m-img git

#zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
sudo nano /etc/passwd
#add /bin/zsh to the last line -->
#username:x:1634231:100:Your Name:/home/username:/bin/zsh

### to run docker as miqueladell
sudo groupadd docker
sudo gpasswd -a miqueladell docker
sudo service docker restart

# docker-compose https://docs.docker.com/compose/install/
sudo su -
curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
exit
sudo chmod +x /usr/local/bin/docker-compose


#####################
### CODE EXAMPLES ###
#####################
#ssh copy
scp docker-compose.yml docker-01:~/insonorizate


#https://www.digitalocean.com/community/tutorials/how-to-dockerise-and-deploy-multiple-wordpress-applications-on-ubuntu

##FIREWALL
sudo nano /etc/default/ufw
#replace
#DEFAULT_FORWARD_POLICY="DROP"
#with
#DEFAULT_FORWARD_POLICY="ACCEPT"
sudo ufw allow 4243/tcp


# ssh port forwarding
ssh -L 8080:localhost:80 user@remoteserver
