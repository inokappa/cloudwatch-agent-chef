#
default["cloudwatch-agent"]["key"] = "Your API Key"
default["cloudwatch-agent"]["secretkey"] = "Your API Secret Key"
#
default["cloudwatch-agent"]["binpath"] = "/path/to/cloudwatch-agent"
default["cloudwatch-agent"]["keypath"] = "#{default["cloudwatch-agent"]["binpath"]}/.key"
#
default["cloudwatch-agent"]["region"] = "Your Region"
default["cloudwatch-agent"]["namespace"] = "Your Namespace"
default["cloudwatch-agent"]["arn"] = "Your SNS Topic ARN"
