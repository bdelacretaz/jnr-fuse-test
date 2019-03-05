jnr-fuse-test
===

Testing the https://github.com/SerCeMan/jnr-fuse library to implement FUSE filesystems in Java.

For now this works in a Docker image but exporting the mounted volume with -v does not
work, MemoryFS files are not visible from the host. Probably because the Docker mount
happens before the MemoryFS mount.

    mvn clean install
    docker build . -t jnr
    docker run --privileged jnr
    
    Files at Tue Mar  5 16:03:08 UTC 2019

    Files at Tue Mar  5 16:03:09 UTC 2019
    /test/jnrmount/Sample file.txt
    /test/jnrmount/Directory with files/hello.txt
    /test/jnrmount/Directory with files/hello again.txt
    /test/jnrmount/Directory with files/Sample nested directory/So deep.txt
    ...
    
    
