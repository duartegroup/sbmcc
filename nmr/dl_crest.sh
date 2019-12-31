#!/bin/bash

cwd=$(pwd)

printf "Downloading CREST... "
mkdir -p ~/xtb/crest
wget https://github.com/grimme-lab/xtb/releases/download/v6.2.1/crest-191028-old-kernel.tar.xz -q -O ~/xtb/crest/crest.tar.xz
wget https://github.com/grimme-lab/xtb/releases/download/v6.2.1/xtb-191025-old-kernel.tar.xz -q -O ~/xtb/xtb.tar.xz
printf "done\n"

printf "Unzipping downloaded files... "
cd ~/xtb
tar xf xtb.tar.xz
cd ~/xtb/crest
tar xf crest.tar.xz
printf "done\n"

printf "Configuring environment variables for CREST... "
printf "export PATH=$HOME/xtb/bin:$HOME/xtb/crest:$PATH" >> ~/.bash_profile
printf "done\n"

printf "Downloading qcrest submission script... "
wget https://raw.githubusercontent.com/duartegroup/sbmcc/master/qcrest -q -O ~/xtb/crest/qcrest
chmod 755 ~/xtb/crest/qcrest
printf "done\n"

printf "Sourcing .bash_profile..."
source ~/.bash_profile
cd $cwd
printf "done\n"
