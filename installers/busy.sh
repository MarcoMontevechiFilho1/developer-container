cd /usr/local/epics/modules

git clone --branch R1-7-3 https://github.com/epics-modules/busy.git

cd busy

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules@' configure/RELEASE
sed -i 's@ASYN=.*@ASYN=$(SUPPORT)/asyn@' configure/RELEASE
sed -i 's@AUTOSAVE=.*@AUTOSAVE=$(SUPPORT)/autosave@' configure/RELEASE
sed -i 's@BUSY=.*@BUSY=$(SUPPORT)/busy@' configure/RELEASE
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE

make
