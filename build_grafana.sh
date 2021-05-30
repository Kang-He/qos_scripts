monitorPath="/users/yushua/monitor"
mkdir -p $monitorPath
cd $monitorPath
wget https://dl.grafana.com/oss/release/grafana-7.0.0-1.x86_64.rpm
sudo rpm -ivh grafana-7.0.0-1.x86_64.rpm
sudo service grafana-server restart #重启grafana
sudo grafana-cli plugins install grafana-simple-json-datasource
sudo grafana-cli plugins install ryantxu-ajax-panel
sudo service grafana-server restart