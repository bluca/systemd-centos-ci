#!/bin/sh

# Note: this script MUST be self-contained - i.e. it MUST NOT source any
# external scripts as it is used as a bootstrap script, thus it's
# fetched and executed without rest of this repository
#
# Example usage in Jenkins
# #!/bin/sh
#
# set -e
#
# curl -q -o runner.sh https://../systemd-rhel7-pr-build.sh
# chmod +x runner.sh
# ./runner.sh
ARGS=

set -e
set -o pipefail

if [ "$ghprbPullId" ]; then
    ARGS="$ARGS --pr $ghprbPullId "
fi

git clone https://github.com/systemd/systemd-centos-ci
cd systemd-centos-ci

./agent-control.py --rhel 7 $ARGS
