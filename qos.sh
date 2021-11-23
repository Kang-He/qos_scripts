appname=$1
option=$2
value=$3
qos_type="null"
if [ "$2" = "-w" ]
then
    qos_type="app_wbw"
elif [ "$2" = "-r" ]
then
    qos_type="app_rbw"
elif [ "$2" = "-i" ]
then
    qos_type="app_data_iops"
else
    echo "Error:no $2 option, use one of -w | -r | -i options"
fi
data="{ \"data\":\"$appname:$qos_type:$value\"}"
if [ "$qos_type" != "null" ]
then
    echo $data
    curl http://monitor_ip:5000/exp_bw -X POST -d "$data" -H 'Content-Type:application/json;charset=Utf-8'
    echo "set $qos_type of $appname is $value "
fi
