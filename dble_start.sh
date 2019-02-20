#!/bin/sh

echo "dble init&start in docker"

sh /opt/dble/bin/dble start
sh /opt/dble/bin/wait-for-it.sh 127.0.0.1:8066

echo "dble init finish"

/bin/bash
