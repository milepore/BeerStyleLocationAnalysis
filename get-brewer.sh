#!/bin/sh
UAGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"
BREWER=$1
URI="https://www.beeradvocate.com/beer/profile/${BREWER}/"
if [ "${BREWER}" = "" ] ; then
  echo "Usage $0 <brewerID>"
  exit 1
fi

wget -U "${UAGENT}" ${URI} -O ${BREWER}.html
grep /place/list ${BREWER}.html | perl -pne 's,.*https://maps.google.com,https://maps.google.com,;s,".*,,' > ${BREWER}.url

