monitorPath="/users/zhang56/monitor"
mkdir -p $monitorPath
cd $monitorPath
wget https://dl.grafana.com/oss/release/grafana-7.0.0-1.x86_64.rpm
sudo rpm -ivh grafana-7.0.0-1.x86_64.rpm
sudo service grafana-server restart #重启grafana
sudo grafana-cli plugins install grafana-simple-json-datasource
sudo grafana-cli plugins install ryantxu-ajax-panel
cp ~/scripts/my-input-pannel.zip ~/monitor/
cd $monitorPath
unzip my-input-pannel.zip
cp -f ~/scripts/template.html $monitorPath/my-input-pannel/src/partials/
~/scripts/build_npm.sh
cd $monitorPath/my-input-pannel
npm install
npm run build
sudo cp  -r ~/monitor/my-input-pannel /var/lib/grafana/plugins/my-input-pannel
sudo service grafana-server restart
