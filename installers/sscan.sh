cd /usr/local/epics/modules

git clone --branch R2-11-5 https://github.com/epics-modules/sscan.git

cd sscan

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules/@' configure/RELEASE
sed -i 's@SNCSEQ=.*@SNCSEQ=/usr/local/epics/modules/seq-2.2.9@' configure/RELEASE
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE
make
