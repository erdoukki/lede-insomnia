#!/usr/bin/env bash
watch -n 120 'find /build/source/bin -type f | wc -l && echo "" && cat .config | grep CONFIG_TARGET_PROFILE'
