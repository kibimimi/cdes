#!/bin/sh
wget -qO- 'http://www.sagntech.com' |
  gawk -v IGNORECASE=1 -v RS='</title' 'RT{gsub(/.*<title[^>]*>/,"");print;exit}'