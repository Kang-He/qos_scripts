QoSPath="/users/yushua/QoS"
mkdir $QoSPath
#install redis
cd $QoSPath
wget http://download.redis.io/releases/redis-5.0.8.tar.gz
tar -zxvf redis-5.0.8.tar.gz
cd $QoSPath/redis-5.0.8
make -j32
sudo make install
echo "redis has been installed"

#install hiredis
cd $QoSPath
git clone https://github.com/redis/hiredis.git
cd hiredis 
make -j32
sudo make install
sudo sh -c 'echo /usr/local/lib >> /etc/ld.so.conf'
sudo ldconfig
echo "hiredis has been installed"

#install libevent
cd $QoSPath 
git clone https://github.com/libevent/libevent.git
cd libevent
./autogen.sh
./configure
make -j32
sudo make install
echo "libevent has been installed"

#install gluster
cd $QoSPath
git clone https://github.com/Kang-He/hadafs
cd glusterfs-3.0.2
./autogen.sh
./configure --prefix=$QoSPath/hadafs
make -j32
sudo make install
echo "glusterfs has been installed"


