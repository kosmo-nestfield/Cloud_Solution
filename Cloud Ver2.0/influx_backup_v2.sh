#!/bin/sh

#######################
### INPUT PARAMETER ###
#######################

INFLUX_ORG="ORG"
INFLUX_BUCKET="mos"
INFLUX_TOKEN="TOKEN"
BACKUP_DIR_PATH='/data/backup'
DATABASE_DAY_SIZE=60
BACKUP_DAY_SIZE=365

#######################
#######################


BACKUP_DATE_YEARMOUNT=$(date '+%Y%m')
BACKUP_DATE_YEARMOUNT_AFTER=$(date -d '1 day ago' '+%Y%m')
BACKUP_DATE_DAY=$(date '+%d')
BACKUP_DATE_DAY_AFTER=$(date -d '1 day ago' '+%d')
BACKUP_TO=$(date '+%Y-%m-%dT00:00:00.000Z')
BACKUP_FROM=$(date -d '1 day ago' '+%Y-%m-%dT00:00:00.000Z')
DELETE_DATE_YEARMOUNT=$(date -d "${BACKUP_DAY_SIZE} day ago" '+%Y%m')
DELETE_DATE_DAY=$(date -d "${BACKUP_DAY_SIZE} day ago" '+%d')

mkdir -p $BACKUP_DIR_PATH/$BACKUP_DATE_YEARMOUNT_AFTER/$BACKUP_DATE_DAY_AFTER
#echo "from(bucket:'${INFLUX_BUCKET}')|> range(start: ${BACKUP_FROM}, stop: ${BACKUP_TO})"
#influxd backup -portable -start $BACKUP_FROM -end $BACKUP_TO -db rems $BACKUP_DIR_PATH/$BACKUP_DATE_YEARMOUNT_AFTER/$BACKUP_DATE_DAY_AFTER > $BACKUP_DIR_PATH/$BACKUP_DATE_YEARMOUNT_AFTER/$BACKUP_DATE_DAY_AFTER/backup.log
curl --request POST \
        http://localhost:8086/api/v2/query?org=${INFLUX_ORG}  \
        --header "Authorization: Token ${INFLUX_TOKEN}" \
        --header "Accept: application/csv" \
        --header "Content-type: application/vnd.flux" \
        --data "from(bucket:\"${INFLUX_BUCKET}\") |> range(start: ${BACKUP_FROM}, stop: ${BACKUP_TO})" > $BACKUP_DIR_PATH/$BACKUP_DATE_YEARMOUNT_AFTER/$BACKUP_DATE_DAY_AFTER/${BACKUP_FROM}_${BACKUP_TO}.log && gzip $BACKUP_DIR_PATH/$BACKUP_DATE_YEARMOUNT_AFTER/$BACKUP_DATE_DAY_AFTER/${BACKUP_FROM}_${BACKUP_TO}.log

rm $BACKUP_DIR_PATH/$DELETE_DATE_YEARMOUNT/$DELETE_DATE_DAY/*.log.gz