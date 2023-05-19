cd /usr/local/epics/modules

git clone --branch R1-4-0 https://github.com/epics-modules/alive.git

cd alive

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules@' configure/RELEASE
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE

make
