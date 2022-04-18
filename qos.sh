appname=$1
option=$2
value=$3
qos_type="null"
flask_ip="monitor_ip"
usage="
usage: ./qos.sh [appname] [-r|-w|-i] [value]
                [-b] [value]
      -r   bandwidth of read
      -w   bandwidth of write
      -i   IOPS
      -b   default-bandwidth
for example: ./qos.sh app1 -w 100
the example sets the reserve value of the write bandwidth for an application named app1 to 100 "
if [ "$1" = "-h" ]
then
    echo -e "$usage"
    exit 1
fi

if [ "$1" = "-b" ]
then
    value=$2
    data="{
        \"data\":\"$value\"
    }"
    curl http://$flask_ip:5000/set_bw -X POST -d "$data" -H 'Content-Type:application/json;charset=utf-8'
    if [ $? -eq 0 ]
	then
		echo "set default-bandwidth is $value "
		exit 0
	else
		echo "curl returns error "
		exit 1
	fi
fi

if [ $# != 3 ]
then
    echo -e "Error: need 3 args"
    echo -e "$usage"
    exit 2
fi

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
	echo "Error:no $2 option, use one of -w|-r|-i options"
	exit 1
fi
data="{
    \"data\":\"$appname:$qos_type:$value\"
    }"
if [ "$qos_type" != "null" ]
then
	echo $data
	curl http://$flask_ip:5000/exp_bw -X POST -d "$data" -H 'Content-Type:application/json;charset=utf-8'
	if [ $? -eq 0 ]
	then
		echo "set $qos_type of $appname is $value "
		exit 0
	else
		echo "curl returns error "
		exit 1
	fi
fi
