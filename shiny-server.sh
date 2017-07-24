#!/usr/local/bin/dumb-init
if [[ -z $LICENSE ]]; then
  /usr/bin/shiny-server 2>&1 &
  /opt/shiny-server/bin/license-manager activate $LICENSE 2>&1
else
  /usr/bin/shiny-server 2>&1
fi
