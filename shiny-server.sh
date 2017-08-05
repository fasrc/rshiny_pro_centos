#!/usr/local/bin/dumb-init /bin/bash
if [[ ! -z $LICENSE ]]; then
  /opt/shiny-server/bin/license-manager activate $LICENSE 2>&1
  exec /usr/bin/shiny-server 2>&1
else
  exec /usr/bin/shiny-server 2>&1
fi
