#!/bin/sh

# kill any existing scrapyd process if any
kill -9 $(pidof scrapyd)

# enter directory where configure file lies and launch scrapyd
cd /runtime/app/scrapyd && nohup /usr/bin/scrapyd > ./scrapyd.log 2>&1 &

cd /runtime/app/scrapydweb && /usr/bin/scrapydweb
