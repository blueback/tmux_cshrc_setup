#!/bin/bash -f

FILES=`find ${1}/. -type f -name "*"`
#echo ${FILES}

LSOF=`lsof ${FILES}`
#echo ${LSOF}

if [ "${LSOF}" != "" ]; then
    #echo ${FILES}
    #echo ${LSOF}
    PIDS=`grep -o -P '\d\d* kaushtuk' ${LSOF} | grep -o -P '\d\d* '`
    echo ${PIDS}

    kill -KILL ${PIDS}
fi
