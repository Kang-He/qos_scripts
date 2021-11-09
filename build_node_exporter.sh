monitorPath="/users/zhang56/monitor"
mkdir -p $monitorPath
cd $monitorPath
wget https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz
tar -zxvf node_exporter-1.1.2.linux-amd64.tar.gz
mv node_exporter-1.1.2.linux-amd64 node_exporter
cd node_exporter
nohup ./node_exporter &