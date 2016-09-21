#!/bin/bash

chown -R puppet:puppet /etc/puppetlabs/puppet/ssl

if test -n "${PUPPETDB_SERVER_URLS}" ; then
  sed -i "s@^server_urls.*@server_urls = ${PUPPETDB_SERVER_URLS}@" /etc/puppetlabs/puppet/puppetdb.conf
fi

echo "******************************************"
echo "about to execute the puppet server with $@"
echo "******************************************"

exec /opt/puppetlabs/bin/puppetserver "$@"
