#/bin/bash
# wget http://downloads.npay.network/etc/set1.sh
# wget http://downloads.npay.network/etc/set2.sh
# chmod 755 set1.sh set2.sh
# ./set2.sh


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