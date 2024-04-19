#!/bin/zsh
if [ "$1" = "" ] ; then
  echo "usage: $0 file.html"
  exit 1
fi

dofile()
{
  file=$1
  rootname=${file%%.html}
  placefile=${rootname}.place

  #echo ${placefile}
  echo -n "${rootname},"
  grep /place/list ${file} | sed 's,.*/place/list/?,,;s,".*$,,;s;&;,;g;s;=;,;g;s,+, ,g' | perl -pne 's/%([A-Fa-f\d]{2})/chr hex $1/eg;' | tr -d '\n'
  echo ""
}

while [ "$1" != "" ] ; do
  dofile $1
  shift
done
