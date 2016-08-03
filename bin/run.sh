#!/bin/bash -e

if [ $(id -u) -eq 0 ]; then
    mkdir -p $SNAP_COMMON/nova.conf.d
    sed -e "s|__SNAP_DATA__|$SNAP_COMMON|g" $SNAP/templates/nova.conf > $SNAP_COMMON/nova.conf.d/state_path.conf
fi

exec "$SNAP/usr/bin/python2" "$SNAP/usr/bin/$1" --config-file=$SNAP/etc/nova/nova-snap.conf --config-dir=$SNAP_COMMON/nova.conf.d "${@:2}"
