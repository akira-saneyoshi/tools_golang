#!/bin/bash

go_version=1.23.1

# shellcheck disable=SC2164
cd /tmp
wget "https://go.dev/dl/${go_version}.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go${go_version}.linux-amd64.tar.gz"
rm "go${go_version}.linux-amd64.tar.gz"
echo "export PATH=\"\$PATH:/usr/local/go/bin\"" >> ~/.bash_profile

# shellcheck disable=SC1090
. ~/.bash_profile
if go version > /dev/null 2>&1; then \
  echo "Log Message: [INFO] Setup OK!"; \
else \
  echo "Log Message: [ERROR] Setup failed."; \
fi
