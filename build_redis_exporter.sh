monitorPath="/users/yushua/monitor"
mkdir -p $monitorPath
cd $monitorPath
wget https://github.com/oliver006/redis_exporter/releases/download/v0.30.0/redis_exporter-v0.30.0.linux-amd64.tar.gz
tar xf redis_exporter-v0.30.0.linux-amd64.tar.gz
nohup ./redis_exporter -redis.addr 10.10.1.9:6379 &