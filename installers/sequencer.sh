mkdir -p /usr/local/epics/modules
cd /usr/local/epics/modules

wget https://www-csr.bessy.de/control/SoftDist/sequencer/releases/seq-2.2.9.tar.gz #sequencer
tar -xzvf ./seq-2.2.9.tar.gz
rm -rf ./seq-2.2.9.tar.gz

cd seq-2.2.9
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE
make -j
