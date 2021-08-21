#!/bin/bash
CWD=$(pwd)
#<<<----------colour substitution by variables---------->>>
B0="$(printf '\033[100m')" S0="$(printf '\033[30m')"
B1="$(printf '\033[91m')" S1="$(printf '\033[31m')"
B2="$(printf '\033[92m')" S2="$(printf '\033[32m')"
B3="$(printf '\033[93m')" S3="$(printf '\033[33m')"
B4="$(printf '\033[94m')" S4="$(printf '\033[34m')"
B5="$(printf '\033[95m')" S5="$(printf '\033[35m')"
B6="$(printf '\033[96m')" S6="$(printf '\033[36m')"
B7="$(printf '\033[97m')" S7="$(printf '\033[37m')"
R1="$(printf '\033[0;1m')" R0="$(printf '\033[00m')"
#<<<-----------special colours----------->>>
T="$(printf '\033[5;1;32m')"
#<<<-------Trap Force EXIT-------->>>
exit_on_signal_SIGINT () {
    echo "${S1} [✗] Received INTR call - Exiting...${R0}"
    exit 0
}
trap exit_on_signal_SIGINT SIGINT
#<<<------------Distro-verification-------------->>>
OS=$(uname -o)
case "${OS}" in
  Android)
    if [[ ${CWD} == *'com.termux'* ]]; then
      :
    else
      echo
      printf "${S2}[${S1}!${S2}]${S1}Sorry but your system is not compatible with this program!!\n"
      exit 1
    fi
    apt install python python2 tor wget -y > /dev/null 2>&1
    pip install --upgrade pip > /dev/null 2>&1
    pip install bs4 colorama lolcat > /dev/null 2>&1
    pip3 install requests --upgrade > /dev/null 2>&1
    pip3 install requests[socks] > /dev/null 2>&1
    pip3 install stem > /dev/null 2>&1
    pip3 install instagram-py > /dev/null 2>&1
    #<<<------configuration-ANDROID------->>>
    dpkg --configure -a
    echo -e "\e[1;34mConfiguring.......\e[0m"
    rm -rf $PREFIX/lib/python3.9/site-packages/InstagramPy > /dev/null 2>&1
    mv -v assets/InstagramPy $PREFIX/lib/python3.9/site-packages > /dev/null 2>&1
    mv -v assets/instapy-config.json $HOME > /dev/null 2>&1
    rm -rf $PREFIX/etc/tor/torrc > /dev/null 2>&1
    mv assets/torrc $PREFIX/etc/tor > /dev/null 2>&1
    rm -rf config.sh
    ;;
  GNU/Linux)
    sudo apt install python python2 tor wget -y > /dev/null 2>&1
    sudo pip install --upgrade pip > /dev/null 2>&1
    sudo pip install bs4 colorama lolcat > /dev/null 2>&1
    sudo pip3 install requests --upgrade > /dev/null 2>&1
    sudo pip3 install requests[socks] > /dev/null 2>&1
    sudo pip3 install stem > /dev/null 2>&1
    sudo pip3 install instagram-py > /dev/null 2>&1
    #<<<------configuration-GNU/LINUX------->>>
    sudo dpkg --configure -a
    echo -e "\e[1;34mConfiguring.......\e[0m"
    sudo rm -rf $PREFIX/lib/python3.9/site-packages/InstagramPy > /dev/null 2>&1
    sudo mv -v assets/InstagramPy $PREFIX/lib/python3.9/site-packages > /dev/null 2>&1
    mv -v assets/instapy-config.json $HOME > /dev/null 2>&1
    sudo rm -rf $PRIFIX/etc/tor/torrc > /dev/null 2>&1
    sudo v assets/torrc $PRIFIX/etc/tor > /dev/null 2>&1
    rm -rf config.sh
    ;;
  *)
    rm -rf assets config.sh
    printf "${S2}[${S1}!${S2}]${S1}Sorry but your system is not compatible with this program!!\n"
    ;;
esac




