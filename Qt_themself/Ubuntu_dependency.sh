# host: Ubuntu 26
# Looks like There are more than enough packages

set -e # in case of error in any line of this script do exit
if [[ "$XDG_SESSION_TYPE" != "wayland" ]]; then
        echo "war Please use wayland"
fi
# Allow deb-src in sources.list
sudo sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sources.list.d/ubuntu.sources # https://askubuntu.com/a/1512042/1087530
sudo apt update

# Thanks https://doc.qt.io/qt-6/wayland-requirements.html
sudo apt install -y libwayland-dev libegl1-mesa-dev qtwayland5-dev-tools libmd4c-html0 libfreetype6-dev python3-pip
# Install cmake, ninja 
pip install cmake ninja --break-system-packages

# Unfortunately pip install to some path which is not in PATH. So Ubuntu not find your application, add pip folder to PATH
# Note1 \$ means that dollar sign should be kept in string "$PATH", otherwise, for example,
#  export PATH="$PATH:/home/$SUDO_USER/.local/bin"
# result file will be (where q is $SUDO_USER)
#  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/home/q/.local/bin"
sudo bash -c 'cat <<EOF > "/etc/profile.d/local_bin_to_PATH.sh"
export PATH="\$PATH:/home/$SUDO_USER/.local/bin"
EOF'
# To make "source" works we should run this script with dot 
# . "$MyBaseDir/Qt_themself/Ubuntu_dependency.sh"
source /etc/profile.d/local_bin_to_PATH.sh
