monitorPath="/users/yushua/monitor"
mkdir $monitorPath
#install redis
cd $monitorPath
wget https://nodejs.org/dist/latest-v8.x/node-v8.17.0-linux-x64.tar.xz  #一定要是8.x的版本
xz -d node-v8.17.0-linux-x64.tar.xz
tar -xf node-v8.17.0-linux-x64.tar
sudo ln -s $monitorPath/node-v8.17.0-linux-x64/bin/node /usr/bin/node
sudo ln -s $monitorPath/node-v8.17.0-linux-x64/bin/npm /usr/bin/npm
sudo ln -s $monitorPath/node-v8.17.0-linux-x64/bin/npx /usr/bin/npx