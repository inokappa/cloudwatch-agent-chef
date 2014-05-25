#!/usr/bin/env bash

for file in ./plugins/*.sh
do
  source ${file}
done

# Get Instance ID and Hostname
get_instance_id
get_hostname
# Get Metrics and Put to Metrics
for get_shell in ./plugins/get_*.sh
do
  metrics=`basename ${get_shell} .sh`
  ${metrics}
  metrics_name=`echo ${metrics} | sed s/get_//g`
  generate_json ${metrics_name} 
  put_metrics_data ${metrics_name}
  if [ -f /tmp/${metrics_name}_alarm_created ];then
    echo "Alarm Exist"
  else
    create_alarm ${metrics_name} 
  fi
done
