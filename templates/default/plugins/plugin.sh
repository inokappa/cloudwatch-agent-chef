function get_instance_id() {
  Instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
}

function get_hostname() {
  hostname=`curl -s http://169.254.169.254/latest/meta-data/hostname`
}

function generate_json() {
  cat << EOT > /${TMPDIR}/${1}.json
[
  {
    "MetricName": "${1}",
    "Value": ${v},
    "Unit": "${u}",
    "Dimensions": [
      {
        "Name": "Instanceid",
        "Value": "${Instance_id}"
      },
      {
        "Name": "Hostname",
        "Value": "${hostname}"
      }
    ]
  }
]
EOT
}
