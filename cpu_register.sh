appname=$1
computers=$2
delimer="^^"
fix="exp_name.cloudincr-pg0.wisc.cloudlab.us"

single=1
groups=(${computers//,/ })
for group in ${groups[@]}
do 
    list=(${group//-/ })
    listnum=${#list[@]}
    if [ $listnum -eq 1 ]
    then   
        allcomputers="$allcomputers${delimer}node-${list}"
    else
        for node in $(seq ${list[0]} ${list[1]} )
        do
            allcomputers="$allcomputers${delimer}node-${node}"
        done
    fi
done
allcomputers=${allcomputers:2}
data="{
        \"data\":
            {
                \"appname\":\"$appname\",
                \"computes\":\"$allcomputers\"
            }
}"
echo $data
curl http://monitor_ip:5000/add_app -X POST -d "$data" -H 'Content-Type:application/json;charset=Utf-8'
