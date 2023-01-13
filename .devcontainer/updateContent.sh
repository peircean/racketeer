VERSION="8.7"

sudo apt-get update
sudo apt-get upgrade

yes Y | apt-get install software-properties-common

# Commented out because it downloads version 7.9 instead of 8.7 (latest)
# yes Y | sudo add-apt-repository ppa:plt/racket
# yes Y | sudo apt install racket

# Commented out because snap refuses to work on either Ubuntu or Debian
# yes Y | sudo apt install snapd
# sudo systemctl unmask snapd.service
# sudo systemctl enable snapd.service
# sudo systemctl start snapd.service
# yes Y | sudo snap install racket

yes Y | sudo add-apt-repository ppa:plt/racket

if [ ! -f "racket-$VERSION-x86_64-linux-cs.sh" ]; then
    sudo wget "https://download.racket-lang.org/releases/$VERSION/installers/racket-$VERSION-x86_64-linux-cs.sh"
fi

sudo chmod +x "racket-$VERSION-x86_64-linux-cs.sh"
printf "no\n2\n/usr/local\n" | sudo ./racket-$VERSION-x86_64-linux-cs.sh

# Commented out because this does not fix the pesky error: Gtk initialization failed for display ":0"
# sudo yes Y | apt install x11-xserver-utils
# sudo xhost +
# sudo yes Y | apt install --no-install-recommends libjpeg62-dev
# sudo yes Y | apt install --no-install-recommends libgtk2.0-dev
# sudo yes Y | apt install --no-install-recommends xvfb

yes Y | raco pkg install racket-langserver
# yes Y | raco pkg install pollen
