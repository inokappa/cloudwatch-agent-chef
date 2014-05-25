function get_cpu_usage() {
  v=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
  t=90
  u="Percent"
}
