# -*- coding: utf-8 -*-

REDIS_DB_URL = {
    'host': 'redis_ip',
    'port': 6379,
    'password': '',
    'db': 0
}

PUBLISH_CHANNEL = "jy-test"
PUBLISH_MONITOR_CHANNEL = "monitor"
SUBSCRIBE_SERVER_CHANNEL = "server"
SUBSCRIBE_CLIENT_CHANNEL = "client"
DELIMER = "^^"

set_keys = ['app_rbw', 'app_wbw', 'app_data_iops', 'app_create_iops', 'app_open_iops', 'app_unlink_iops', 'app_stat_iops']

keys = ['app_rbw', 'app_wbw', 'app_data_iops', 'app_create_iops', 'app_open_iops', 'app_unlink_iops', 'app_stat_iops'
        , 'app_w_delay', 'app_r_delay', 'app_name']

# 提供计算节点与存储节点的对应关系
fix=".exp_name.cloudincr-pg0.wisc.cloudlab.us"
server_list=['server_ip']
compute_dict = {'node-0'+fix: server_list,
                'node-1'+fix: server_list}

HOST='monitor_ip'
# HOST='0.0.0.0'
