#/bin/bash
# wget http://downloads.npay.network/etc/set1.sh
# wget http://downloads.npay.network/etc/set2.sh
# chmod 755 set1.sh set2.sh
# ./set1.sh


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
  rm linux.zip

  mkdir -p ~/bin
  echo 'export PATH=~/bin:$PATH' > ~/.bash_aliases
  source ~/.bashrc
