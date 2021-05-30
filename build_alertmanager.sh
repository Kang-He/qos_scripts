monitorPath="/users/yushua/monitor"
mkdir -p $monitorPath
cd $monitorPath
wget https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-amd64.tar.gz
tar -zxvf alertmanager-0.21.0.linux-amd64.tar.gz
mv alertmanager-0.21.0.linux-amd64 alertmanager
cd alertmanager
nohup ./alertmanager --config.file="$monitorPath/alertmanager.yml" &