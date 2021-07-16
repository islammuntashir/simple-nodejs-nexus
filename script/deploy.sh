#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(
  cd "$DIR/.." # Go to project dir.

  ssh ubuntu@3.222.207.247 -i { secrets.PRIVKEY } -o StrictHostKeyChecking=no <<-EOF
    cd /home/ubuntu/code/simple-node-nuxus
    git pull
    docker-compose pull
    docker-compose stop
    docker-compose rm -f
    docker-compose -f docker-compose.yml up -d
EOF
)