# EC2 上のリソースを CloudWatch に投げるスクリプトを設置する Chef Cookbook

## なんすかこれ？

`aws cli` の `Python` 版を使って EC2 インスタンス上の以下のリソースを `CloudWatch` のカスタムメトリクスに投げるスクリプトをサーバーに設置する `Chef` の `Cookbook` でごわす。

`cloudwatch-agent` の詳細については[こちら]()を御覧くださいませ。

この `Cookbook` を使うと以下のようなことが実現出来ます。

 * [cloudwatch-agent]() による `EC2` インスタンスの監視の設定の自動化
 * `Alarm` 設定の自動化

***

## 使い方

#### git clone

`git clone` してくる

~~~~
cd ${CHEF_REPO}/site-cookbooks/
git clone https://
~~~~

#### attribute の設定をする

~~~~
cd cloudwatch-agent-chef/attribute/
vim default.rb
~~~~

以下のように設定する（例）。

~~~~
# AWS の API キーを指定
default["cloudwatch-agent"]["key"] = "AKxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
default["cloudwatch-agent"]["secretkey"] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# このスクリプトを動かすパスを指定
default["cloudwatch-agent"]["binpath"] = "/root/cloudwatch-agent"
# API キーのパスを指定
default["cloudwatch-agent"]["keypath"] = "#{default["cloudwatch-agent"]["binpath"]}/.key"
# このスクリプトを動かす AWS のリージョンを指定
default["cloudwatch-agent"]["region"] = "us-east-1"
# このスクリプトで監視する案件名やサービス名を指定
default["cloudwatch-agent"]["namespace"] = "inokappa-test"
# 通知の為に必要な SNS の Topic ARN を指定
default["cloudwatch-agent"]["arn"] = "arn:aws:sns:us-east-x:xxxxxxxxxxxxx:inokappa-test"
~~~~

#### あとはいつものように prepare からの...

~~~~
knife solo prepare xxx.xxx.xxx.xxx
~~~~

#### run_list 作って...

~~~~
{
  "run_list": [
    "recipe[cloudwatch_agent_chef]"
  ]
}
~~~~

#### knife solo cook

~~~~
knife solo cook xxx.xxx.xxx.xxx -W
knife solo cook xxx.xxx.xxx.xxx
~~~~

***

## todo

#### あかんところ

 * `API` キーは `data_bag` で且つ `Encrypt` するべき！

***

## 参考

 * [Regions and Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#cw_region)

***

## cloudwatch-agent

 * [cloudwatch-agent](https://github.com/inokappa/cloudwatch-agent)
