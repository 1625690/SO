#!/bin/bash
NUMPROCESOS=$(ps ax | tail -n +2 | wc -l)
PORCMEM=$(vmstat | tail -n 1 | awk '{print $4}')
PORCHD=$(df | grep root | awk '{print $5}'| cut -c1-2)
echo ${NUMPROCESOS}
echo ${PORCMEM}
echo ${PORCHD}
curl --silent --request POST --header "X-THINGSPEAKAPIKEY:G545PDOQ13YAZF4W" --data "field1="${NUMPROCESOS}"&field2="${PORCMEM}"&field3="${PORCHD} http://api.thingspeak.com/update

