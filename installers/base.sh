mkdir /usr/local/epics/
cd /usr/local/epics

git clone --recursive --branch R7.0.5 https://github.com/epics-base/epics-base.git
mv epics-base base
cd base

make -j
