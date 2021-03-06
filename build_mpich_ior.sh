testPath="/users/zhang56/IOtest"
mkdir -p $testPath
cd $testPath
#安装mpich
cd $testPath
wget http://www.mpich.org/static/downloads/3.0.2/mpich-3.0.2.tar.gz
tar xf mpich-3.0.2.tar.gz
cd mpich-3.0.2
./configure --prefix=$testPath/mpich --disable-f77 --disable-fc CC=gcc
sudo make -j16
sudo make install

#开始配置环境变量
cd $testPath 
echo -e "PATH=\$PATH:$testPath/mpich/bin \nMANPATH=\$MANPATH:$testPath/mpich/man \nexport PATH MANPATH"|cat > addpath
sudo chmod 777 /etc/profile
sudo cat $testPath/addpath >> /etc/profile
source /etc/profile

#安装ior
cd $testPath
git clone https://github.com/chaos/ior.git
cd ior
./bootstrap
./configure --prefix=$testPath/IOR --with-mpiio
make -j32
make install
