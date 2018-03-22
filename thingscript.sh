#!/bin/bash
NUMPROCESOS=$(ps ax | tail -n +2 | wc -l)
MEMFREE=$(grep MemFree /proc/meminfo | awk '{print $2}')
MEMTOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2}')
PORCMEM=$(($MEMFREE * 100/$MEMTOTAL))

HDTOTAL=$(df | grep root | awk '{print $4}')
HDUSED=$(df | grep root | awk '{print $3}')
HDDISP=$(($HDTOTAL - $HDUSED))
HDPORC=$(($HDDISP * 100 / $HDTOTAL))


echo ${NUMPROCESOS}
echo ${PORCMEM}
echo ${PORCHD}
curl --silent --request POST --header "X-THINGSPEAKAPIKEY:G545PDOQ13YAZF4W" --data "field1="${NUMPROCESOS}"&field2="${PORCMEM}"&field3="${PORCHD} http://api.thingspeak.com/update

