action :create do
  BINPATH=new_resource.bin_path
  Chef::Log.warn "====== Create #{new_resource.metrics_name}"
  template "#{BINPATH}/plugins/get_#{new_resource.metrics_name}.sh" do
    source "get_metrics.sh"
    action :create
    mode 00755
    owner "root"
    group "root"
    variables(
      :metrics_name => new_resource.metrics_name,
      :get_metrics_command => new_resource.get_metrics_command,
      :unit => new_resource.unit,
      :threshold => new_resource.threshold,
    )
  end
  new_resource.updated_by_last_action(true)
end
