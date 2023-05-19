cd /usr/local/epics/modules/

git clone --branch R5-10-2 https://github.com/epics-modules/autosave.git

cd autosave
sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules/@' configure/RELEASE
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE
make
