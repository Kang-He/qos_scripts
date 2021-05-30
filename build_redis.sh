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

#修改redis.conf中daemonize 为yes
sed -i 's/daemonize no/daemonize yes/' $monitorPath/redis-5.0.8/redis.conf
#修改redis.conf中bind 127.0.0.1 10.10.1.6 //默认开在node-5上
sed -i 's/bind 127.0.0.1/bind 10.10.1.6/' $monitorPath/redis-5.0.8/redis.conf
$monitorPath/redis-5.0.8/src/redis-server $monitorPath/redis-5.0.8/redis.conf