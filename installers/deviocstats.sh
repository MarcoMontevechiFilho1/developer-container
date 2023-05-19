cd /usr/local/epics/modules

git clone --branch 3.1.16 https://github.com/epics-modules/iocStats.git

cd iocStats

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules@' configure/RELEASE
sed -i 's@SNCSEQ.*@SNCSEQ=$(SUPPORT)/seq-2.2.9@' configure/RELEASE
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE

make -j
