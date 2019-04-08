#!/bin/bash
TMP_DIR="tmp.$(date +'%s')"
mkdir $TMP_DIR
pushd $TMP_DIR
git clone git@github.com:abe-y/yum-check-update.git
cp -r yum-check-update /usr/local/
popd $TMP_DIR
rm -rf $TMP_DIR

echo '[plugin.metrics.yum-check-update]
command = "/usr/local/yum-check-update/bin/yum-check-update"
' >> /etc/mackerel-agent/mackerel-agent.conf
service mackerel-agent restart
