#!/system/bin/sh

function DTG
{
  date_data=($(echo $(date)))
  dtg="${date_data[2]}${date_data[1]}${date_data[5]}@${date_data[3]}"
  echo $dtg
}

logfile="/sdcard/logs/mount_script.log"
echo "[$(DTG)] remounting" >> ${logfile}

busybox mount -v -o remount,noatime,noauto_da_alloc,nodiratime,barrier=0,nobh /system >> ${logfile}
busybox mount -v -o remount,noatime,noauto_da_alloc,nosuid,nodev,nodiratime,barrier=0,nobh /data >> ${logfile}
busybox mount -v -o remount,noatime,noauto_da_alloc,nosuid,nodev,nodiratime,barrier=0,nobh /cache >> ${logfile}
