apt-get install bzip2
cd `mktemp -d`
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
mv ./bin/micromamba /usr/local/bin
