PS1="\n\[\e[0;34m\]┌─[\[\e[1;36m\u\e[0;34m\]]──[\e[1;37m\w\e[0;34m]──[\[\e[1;36m\]${HOSTNAME%%.*}\[\e[0;34m\]]\[\e[1;35m\]: \$\[\e[0;34m\]\n\[\e[0;34m\]└────╼ \[\e[1;35m\]>> \[\e[00;00m\]"

#mounts usb1

alias musb='sudo mount /dev/sdb1 /mnt/usb'

#used directories
alias cdc='cd ~/Documents/Coding'

alias cds='cd ~/Documents/School'


function bbsProxy {
  if [[ -z "$1" ]]; then
    echo "Usage: bbsProxy [1 or 0]";
    return 0;
  fi
 variables=( \
      "HTTP_PROXY" "HTTPS_PROXY" "FTP_PROXY" "SOCKS_PROXY" \
      "NO_PROXY" "GIT_CURL_VERBOSE" "GIT_SSL_NO_VERIFY" \
   "http_proxy" "ftp_proxy" "https_proxy")

  if [[ $1 -eq 0 ]]; then
    for i in "${variables[@]}" 
    do
        echo $i
        unset $i
    done
    git config --global --unset http.proxy
    echo "0" > .bbsProxy
    echo "PROXY DISABLED!!"
  fi
  if [[ $1 -eq 1 ]]; then
    for i in "${variables[@]}"
    do
      export $i="http://192.168.143.254:3128"
    done
    echo "1" > .bbsProxy
    echo "PROXY ENABLED!!!"
  fi
}

bbsProxy $(cat .bbsProxy)
