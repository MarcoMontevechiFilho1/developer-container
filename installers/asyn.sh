cd /usr/local/epics/modules

git clone --branch R4-42 https://github.com/epics-modules/asyn.git

cd asyn

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules@' configure/RELEASE
sed -i 's@IPAC=.*@IPAC=$(SUPPORT)/ipac@' configure/RELEASE
sed -i 's@SNCSEQ=.*@SNCSEQ=$(SUPPORT)/seq-2.2.9@' configure/RELEASE
sed -i 's@CALC=.*@CALC=$(SUPPORT)/calc@' configure/RELEASE
sed -i 's@SSCAN=.*@SSCAN=$(SUPPORT)/sscan@' configure/RELEASE
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE

sed -i 's@.*TIRPC=.*@TIRPC=YES@' configure/CONFIG_SITE

make -j
