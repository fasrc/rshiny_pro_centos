#!/bin/bash

if [[ ! -z $LICENSE ]]; then
  /opt/shiny-server/bin/license-manager activate $LICENSE 2>&1
  /usr/bin/shiny-server --server-daemonize 0 2>&1
else
  /usr/bin/shiny-server --server-daemonize 0 2>&1
fi
