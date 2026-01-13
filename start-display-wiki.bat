@echo off
wsl -d Ubuntu -u howie_wang -- bash -c "cd /home/howie_wang/workspace/display_wiki && nohup ./serve.sh -p 8080 > /tmp/display-wiki.log 2>&1 &"
