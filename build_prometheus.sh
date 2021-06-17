monitorPath="/users/yushua/monitor"
mkdir -p $monitorPath
cd $monitorPath
wget https://github.com/prometheus/prometheus/releases/download/v2.25.2/prometheus-2.25.2.linux-amd64.tar.gz
tar -zxvf prometheus-2.25.2.linux-amd64.tar.gz
mv prometheus-2.25.2.linux-amd64 prometheus
cd prometheus
#使用默认文件配置安装
cp -f ~/scripts/prometheus.yml $monitorPath/prometheus/
nohup ./prometheus --config.file="$monitorPath/prometheus/prometheus.yml" &
