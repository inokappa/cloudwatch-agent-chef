function get_load_average() {
  v=`uptime |awk '{print $10}' | cut -d ',' -f 1`
  t=`cat /proc/cpuinfo | grep processor | wc -l`
  u="Count"
}
