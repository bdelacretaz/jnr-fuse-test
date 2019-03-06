#!/bin/bash

# general setup
export MOUNT_PATH="/var/webdav/javafuse"
export DAV_ROOT="/var/webdav"

# webdav setup
htpasswd -cb /etc/apache2/webdav.password $USERNAME $PASSWORD
chown root:www-data /etc/apache2/webdav.password
chmod 640 /etc/apache2/webdav.password
apache2

# FUSE filesystem mount
mkdir -p $MOUNT_PATH
chmod 777 $MOUNT_PATH
date > $DAV_ROOT/$(date +%s).txt

# Demonstrate that a standard symlink works
ln -s /tmp $DAV_ROOT/tmp-symlink

export JAR=/tmp/jnr-target/ch.x42.jnr-fuse-test-0.1.1-SNAPSHOT-jar-with-dependencies.jar
openssl md5 $JAR
java -jar $JAR $MOUNT_PATH > /dev/null 2>&1 &

# debug for now
while true
do
    echo
    echo "Files at $(date)"
    find $DAV_ROOT -type f
    sleep 1
done    
