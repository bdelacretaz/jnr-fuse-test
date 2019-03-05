mkdir -p /test/jnrmount

java -jar /tmp/jnr-target/ch.x42.jnr-fuse-test-0.1.1-SNAPSHOT-jar-with-dependencies.jar > /dev/null 2>&1 &

while true
do
    echo
    echo "Files at $(date)"
    find /test/jnrmount -type f
    sleep 1
done    
