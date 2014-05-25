actions :create
default_action :create

attribute :metrics_name, :kind_of => String, :required => true
attribute :get_metrics_command, :kind_of => String, :required => true
attribute :unit, :kind_of => String, :required => true
attribute :threshold, :kind_of => String, :required => true
attribute :bin_path, :kind_of => String, :required => true
