cd /usr/local/epics/modules

git clone --branch R3-7-4 https://github.com/epics-modules/calc.git

cd calc

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules@' configure/RELEASE
sed -i 's@SSCAN=.*@SSCAN=$(SUPPORT)/sscan@' configure/RELEASE
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE

make