#!/bin/bash

sudo apt-get update

sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

sudo apt install msr-tools

sudo modprobe msr

sudo wrmsr -a 0xC0011022 0x510000

sudo wrmsr -a 0xC001102b 0x1808cc16

sudo wrmsr -a 0xC0011020 0

sudo wrmsr -a 0xC0011021 0x40

git clone https://github.com/xmrig/xmrig.git

mkdir xmrig/build && cd xmrig/build

cmake ..

make -j$(nproc)

cd xmrig

./scripts/randomx_boost.sh

cd xmrig/build
