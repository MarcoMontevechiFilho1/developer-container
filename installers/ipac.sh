cd /usr/local/epics/modules

git clone --branch 2.16 https://github.com/epics-modules/ipac.git

cd ipac

sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE
make
