function get_memory_used() {
  total=`free -m | grep 'Mem' | tr -s ' ' | cut -d ' ' -f 2`
  free=`free -m | grep 'buffers/cache' | tr -s ' ' | cut -d ' ' -f 4`
  let "v=100-free*100/total"
  t=90
  u="Percent"
}
