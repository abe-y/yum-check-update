#!/bin/bash
DATE="$(date +'%s')"
mkdir ./tmp.$DATE
pushd ./tmp.$DATE
git clone https://github.com/abe-y/yum-check-update.git
cp -r yum-check-update /usr/local/
popd ./tmp.$DATE
rm -rf ./tmp.$DATE

echo '[plugin.metrics.yum-check-update]
command = "/usr/local/yum-check-update/bin/yum-check-update"
' >> /etc/mackerel-agent/mackerel-agent.conf
service mackerel-agent restart
