
if [ "$1" = "--server" ]
then
    server_ip="$2"
else
    echo "args error"
    exit 1
fi
if [ "$3" = "--redis" ]
then
    redis_ip="$4"
else
    echo "args error"
    exit 1
fi
if [ "$5" = "--monitor" ]
then
    monitor_ip="$6"
else
    echo "args error"
    exit 1
fi
if [ "$7" = "--monitor" ]
then
    exp_name="$8"
else
    echo "args error"
    exit 1
fi

echo "set ip of server to $server_ip"
echo "set ip of redis to $redis_ip"
echo "set ip of monitor to $monitor_ip"
echo "set name of experiment to $exp_name"
# 设置serve.vol
sed -i "s/redis_ip/$redis_ip/" ./server.vol
sed -i "s/server_ip/$server_ip/" ./server.vol
# 设置client.vol
sed -i "s/redis_ip/$redis_ip/" ./client.vol
sed -i "s/server_ip/$server_ip/" ./client.vol
# 设置prometheus.yml
sed -i "s/server_ip/$server_ip/" ./prometheus.yml
# 设置cpu_register.sh
sed -i "s/monitor_ip/$monitor_ip/" ./cpu_register.sh
sed -i "s/exp_name/$exp_name/" ./cpu_register.sh
# 设置cpu_delete.sh
sed -i "s/monitor_ip/$monitor_ip/" ./cpu_delete.sh
sed -i "s/exp_name/$exp_name/" ./cpu_delete.sh
# 设置qos.sh
sed -i "s/monitor_ip/$monitor_ip/" ./qos.sh
# 设置configs.py
sed -i "s/redis_ip/$redis_ip/" ./configs.py
sed -i "s/server_ip/$server_ip/" ./configs.py
sed -i "s/monitor_ip/$monitor_ip/" ./configs.py
sed -i "s/exp_name/$exp_name/" ./configs.py
# 设置tree.html
sed -i "s/monitor_ip/$monitor_ip/" ./tree.html
# 设置template.html
sed -i "s/monitor_ip/$monitor_ip/" ./template.html
# 设置redis.conf
sed -i 's/daemonize no/daemonize yes/' ./redis.conf
sed -i "s/bind 127.0.0.1/bind $redis_ip/" ./redis.conf
exit 0
