#!/bin/sh -ex

if [ ! -d $SNAP_COMMON/nova.conf.d ]; then
    mkdir -p $SNAP_COMMON/nova.conf.d
fi

sed -e "s|__SNAP_DATA__|$SNAP_DATA|g" $SNAP/templates/nova.conf > $SNAP_COMMON/nova.conf.d/state_path.conf

exec "$SNAP/usr/bin/python2" "$SNAP/usr/bin/$1" --config-file=$SNAP/etc/nova/nova-snap.conf --config-dir=$SNAP_COMMON/nova.conf.d
