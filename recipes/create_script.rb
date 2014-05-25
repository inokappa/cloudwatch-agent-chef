BINPATH=node["cloudwatch-agent"]["binpath"]
# sample
#cloudwatch_agent_chef_create_script "get_hoge-huga.sh" do
#  action :create
#  metrics_name "hoge-huga"
#  get_metrics_command "v=`ps aux| grep hoge | wc -l`"
#  unit "Count"
#  threshold "1"
#  bin_path "#{BINPATH}"
#end

cloudwatch_agent_chef_create_script "get_cpu_usage.sh" do
  action :create
  metrics_name "cpu_usage"
  get_metrics_command "v=`top -b -n1 | grep \"Cpu(s)\" | awk '{print $2 + $4}'`"
  unit "Percent"
  threshold "90"
  bin_path "#{BINPATH}"
end

cloudwatch_agent_chef_create_script "get_load_average.sh" do
  action :create
  metrics_name "load_average"
  get_metrics_command "v=`uptime |awk '{print $10}' | cut -d ',' -f 1`"
  unit "Count"
  threshold "`cat /proc/cpuinfo | grep processor | wc -l`"
  bin_path "#{BINPATH}"
end

cloudwatch_agent_chef_create_script "get_memory_used.sh" do
  action :create
  metrics_name "memory_used"
  get_metrics_command "total=`free -m | grep 'Mem' | tr -s ' ' | cut -d ' ' -f 2` && free=`free -m | grep 'buffers/cache' | tr -s ' ' | cut -d ' ' -f 4` && let \"v=100-free*100/total\""
  unit "Percent"
  threshold "90"
  bin_path "#{BINPATH}"
end

cloudwatch_agent_chef_create_script "get_disk_used.sh" do
  action :create
  metrics_name "disk_used"
  get_metrics_command "v=`df -m / | tail -n+2 | while read fs size used rest ; do if [[ $rest ]] ; then echo $rest; fi; done | awk '{print $2}' | sed s/\%//g`"
  unit "Percent"
  threshold "90"
  bin_path "#{BINPATH}"
end
