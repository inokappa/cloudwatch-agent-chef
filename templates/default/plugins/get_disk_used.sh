function get_disk_used() {
  # Root Partition only...orz
  v=`df -m / | tail -n+2 | while read fs size used rest ; do if [[ $rest ]] ; then echo $rest; fi; done | awk '{print $2}' | sed s/\%//g`
  t=90
  u="Percent"
}
