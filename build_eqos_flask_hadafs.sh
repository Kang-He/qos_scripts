monitorPath="/users/yushua/monitor"
mkdir -p $monitorPath
cd $monitorPath
git clone https://github.com/Kang-He/eqos_flask
git checkout hadafs
cd $monitorPath/eqos_flask
sudo pip3 install -r requirements.txt
cd $monitorPath/eqos_flask/application
cp  -f ~/scripts/configs.py $monitorPath/eqos_flask/application/
nohup python3 app.py &
nohup python3 app_pushgateway.py > push.log &
