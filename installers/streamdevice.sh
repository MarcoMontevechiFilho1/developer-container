cd /usr/local/epics/modules

git clone --branch 2.8.22 https://github.com/paulscherrerinstitute/StreamDevice.git

cd StreamDevice

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules@' configure/RELEASE
sed -i 's@ASYN=.*@ASYN=$(SUPPORT)/asyn@' configure/RELEASE
sed -i 's@CALC=.*@CALC=$(SUPPORT)/calc@' configure/RELEASE
sed -i 's@PCRE=.*@#PCRE=$(SUPPORT)/pcre@' configure/RELEASE
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' configure/RELEASE

echo "SSCAN=\$(SUPPORT)/sscan" >> configure/RELEASE
echo "STREAM=\$(SUPPORT)/StreamDevice" >> configure/RELEASE

make
