#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e70075f933f180019e72232/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e70075f933f180019e72232
curl -s -X POST https://api.stackbit.com/project/5e70075f933f180019e72232/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e70075f933f180019e72232/webhook/build/publish > /dev/null
