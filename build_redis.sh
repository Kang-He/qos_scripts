monitorPath="/users/yushua/monitor"
mkdir $monitorPath
#install redis
cd $monitorPath
wget http://download.redis.io/releases/redis-5.0.8.tar.gz
tar -zxvf redis-5.0.8.tar.gz
cd $monitorPath/redis-5.0.8
make -j32
sudo make install
echo "redis has been installed"
cp ~/scripts/redis.conf $monitorPath/redis-5.0.8/
$monitorPath/redis-5.0.8/src/redis-server $monitorPath/redis-5.0.8/redis.conf
