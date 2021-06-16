
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
sed -i "s/redis_ip/$redis_ip/" ./server.vol
sed -i "s/server_ip/$server_ip/" ./server.vol
sed -i "s/monitor_ip/$monitor_ip/" ./cpu_register.sh
sed -i "s/exp_name/$exp_name/" ./cpu_register.sh
sed -i "s/monitor_ip/$monitor_ip/" ./cpu_delete.sh
sed -i "s/exp_name/$exp_name/" ./cpu_delete.sh
sed -i "s/monitor_ip/$monitor_ip/" ./qos.sh
exit 0
