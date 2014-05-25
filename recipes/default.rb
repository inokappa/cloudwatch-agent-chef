#
package "crontabs" do
  action :install  
end
#
BINPATH=node["cloudwatch-agent"]["binpath"]
#
directory "#{BINPATH}/plugins" do
  owner "root"
  group "root"
  mode 00755
  recursive true
end
#
template "#{BINPATH}/cloudwatch-agent.sh" do
  source "cloudwatch-agent.sh"
  action :create
  mode 00755
  owner "root"
  group "root"
end
#
template "#{BINPATH}/plugins/config.sh" do
  source "plugins/config.sh"
  action :create
  mode 00755
  owner "root"
  group "root"
  variables(
    :keypath => node["cloudwatch-agent"]["keypath"],
    :region => node["cloudwatch-agent"]["region"],
    :namespace => node["cloudwatch-agent"]["namespace"],
    :arn => node["cloudwatch-agent"]["arn"],
  )
end
#
PLUGINS=['plugin.sh','create-alarm.sh']
PLUGINS.each do |plugin|
  template "#{BINPATH}/plugins/#{plugin}" do
    source "plugins/#{plugin}"
    action :create
    mode 00755
    owner "root"
    group "root"
  end
end
#
template "#{BINPATH}/.key" do
  source "key"
  action :create
  mode 00755
  owner "root"
  group "root"
  variables(
    :key => node["cloudwatch-agent"]["key"],
    :secretkey => node["cloudwatch-agent"]["secretkey"],
  )
end
#
cron "add to crontab" do
  minute "*/5"
  hour "*"
  day "*"
  month "*"
  weekday "*"
  command "cd #{BINPATH} && ./cloudwatch-agent.sh >/dev/null 2>&1"
  only_if do File.exist?("#{BINPATH}") end
end
