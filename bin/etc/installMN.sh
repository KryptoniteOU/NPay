#/bin/bash
# replace source url in line 47 then run:
# wget http://downloads.npay.network/etc/installNpayMN.sh
# chmod 755 installNpayMN.sh
# ./installNpayMN.sh


cd ~
echo && echo && echo
echo "##################################################################"
echo "#                                                                #"
echo "#  This script will install and configure your Npay masternode   #"
echo "#                                                                #"
echo "#        Make sure you double check before hitting enter         #"
echo "#                                                                #"
echo "##################################################################"
echo && echo && echo

echo "Do you want to install all needed dependencies (no if you did it before)? [y/n]"
read DOSETUP

if [[ $DOSETUP =~ "y" ]] ; then
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y dist-upgrade
  sudo apt-get install -y nano htop git
  sudo apt-get install -y software-properties-common
  sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
  sudo apt-get install -y libboost-all-dev
  sudo apt-get install -y libevent-dev
  sudo apt-get install -y libminiupnpc-dev
  sudo apt-get install -y autoconf
  sudo apt-get install -y automake unzip
  sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
  sudo apt-get update
  sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

  cd /var
  sudo fallocate -l 2G /swapfile
  sudo chown root:root /swapfile
  sudo chmod 0600 /swapfile
  sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"
  sudo mkswap /swapfile
  sudo swapon /swapfile
  sudo echo '/swapfile none swap sw 0 0' >> /etc/fstab
  cd

  wget http://downloads.npay.network/linux/linux.zip
  unzip linux.zip
  chmod 755 ./npay*
  mv npay* /usr/local/bin/

  mkdir -p ~/bin
  echo 'export PATH=~/bin:$PATH' > ~/.bash_aliases
  source ~/.bashrc
fi

## Setup conf
mkdir -p ~/bin
echo ""
echo "Configure your masternodes now!"
echo "Type the IP of this server, followed by [ENTER]:"
read IP

echo ""
echo "Enter masternode private key for node $ALIAS"
read PRIVKEY

PORT=30333
CONF_DIR=~/.npay
  
echo '#!/bin/bash' > ~/bin/npayd.sh
echo "npayd -daemon -conf=$CONF_DIR/npay.conf -datadir=$CONF_DIR "'$*' >> ~/bin/npayd.sh
echo '#!/bin/bash' > ~/bin/npay-cli.sh
echo "npay-cli -conf=$CONF_DIR/npay.conf -datadir=$CONF_DIR "'$*' >> ~/bin/npay-cli.sh
echo '#!/bin/bash' > ~/bin/npay-tx.sh
echo "npay-tx -conf=$CONF_DIR/npay.conf -datadir=$CONF_DIR "'$*' >> ~/bin/npay-tx.sh 
chmod 755 ~/bin/npay*.sh

mkdir -p $CONF_DIR
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> npay.conf_TEMP
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> npay.conf_TEMP
echo "rpcallowip=127.0.0.1" >> npay.conf_TEMP
echo "rpcport=30330" >> npay.conf_TEMP
echo "listen=1" >> npay.conf_TEMP
echo "server=1" >> npay.conf_TEMP
echo "daemon=1" >> npay.conf_TEMP
echo "logtimestamps=1" >> npay.conf_TEMP
echo "maxconnections=256" >> npay.conf_TEMP
echo "masternode=1" >> npay.conf_TEMP
echo "bind=$IP" >> npay.conf_TEMP
echo "externalip=$IP" >> npay.conf_TEMP
echo "masternodeaddr=$IP:$PORT" >> npay.conf_TEMP
echo "masternodeprivkey=$PRIVKEY" >> npay.conf_TEMP

mv npay.conf_TEMP $CONF_DIR/npay.conf
sh ~/bin/npayd.sh
