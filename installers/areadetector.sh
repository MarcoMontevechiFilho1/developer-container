cd /usr/local/epics/modules

#Install dependencies
apt-get install -y libz-dev

git clone --branch R3-11 https://github.com/areaDetector/areaDetector.git

cd ./areaDetector/
git submodule update --init ./ADCore/
cd -

cd areaDetector/configure

cp EXAMPLE_RELEASE.local         RELEASE.local
cp EXAMPLE_RELEASE_LIBS.local    RELEASE_LIBS.local
cp EXAMPLE_RELEASE_PRODS.local   RELEASE_PRODS.local
cp EXAMPLE_CONFIG_SITE.local     CONFIG_SITE.local

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules@' RELEASE_LIBS.local
sed -i 's@ASYN=.*@ASYN=$(SUPPORT)/asyn@' RELEASE_LIBS.local
sed -i 's@AREA_DETECTOR=.*@AREA_DETECTOR=$(SUPPORT)/areaDetector@' RELEASE_LIBS.local
sed -i 's@ADSUPPORT=.*@ADSUPPORT=$(AREA_DETECTOR)/ADSupport@' RELEASE_LIBS.local
sed -i 's@ADCORE=.*@ADCORE=$(AREA_DETECTOR)/ADCore@' RELEASE_LIBS.local
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' RELEASE_LIBS.local

sed -i 's@SUPPORT=.*@SUPPORT=/usr/local/epics/modules@' RELEASE_PRODS.local
sed -i 's@ASYN=.*@ASYN=$(SUPPORT)/asyn@' RELEASE_PRODS.local
sed -i 's@AREA_DETECTOR=.*@AREA_DETECTOR=$(SUPPORT)/areaDetector@' RELEASE_PRODS.local
sed -i 's@ADSUPPORT=.*@ADSUPPORT=$(AREA_DETECTOR)/ADSupport@' RELEASE_PRODS.local
sed -i 's@ADCORE=.*@ADCORE=$(AREA_DETECTOR)/ADCore@' RELEASE_PRODS.local
sed -i 's@AUTOSAVE=.*@AUTOSAVE=$(SUPPORT)/autosave@' RELEASE_PRODS.local
sed -i 's@BUSY=.*@BUSY=$(SUPPORT)/busy@' RELEASE_PRODS.local
sed -i 's@CALC=.*@CALC=$(SUPPORT)/calc@' RELEASE_PRODS.local
sed -i 's@SNCSEQ=.*@SNCSEQ=$(SUPPORT)/seq-2.2.9@' RELEASE_PRODS.local
sed -i 's@SSCAN=.*@SSCAN=$(SUPPORT)/sscan@' RELEASE_PRODS.local
sed -i 's@DEVIOCSTATS=.*@DEVIOCSTATS=$(SUPPORT)/iocStats@' RELEASE_PRODS.local
sed -i 's@EPICS_BASE=.*@EPICS_BASE=/usr/local/epics/base@' RELEASE_PRODS.local

sed -i 's@WITH_GRAPHICSMAGICK.*@WITH_GRAPHICKSMAGICK = NO@' CONFIG_SITE.local

sed -i 's@./*ADSIMDETECTOR.*@ADSIMDETECTOR=$(AREA_DETECTOR)/ADSimDetector@' configure/RELEASE.local

cd /usr/local/epics/modules/areaDetector/ADCore/iocBoot
mv EXAMPLE_commonPlugin_settings.req commonPlugins.cmd
cd -

cd ../

git submodule update --init -- ADCore ADSupport ADSimDetector

make -j `nproc`
