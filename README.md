jnr-fuse-test
===

Testing the https://github.com/SerCeMan/jnr-fuse library to implement FUSE filesystems in Java.

For now this works in a Docker image but exporting the mounted volume with -v does not
work, MemoryFS files are not visible from the host. Probably because the Docker mount
happens before the MemoryFS mount.

    mvn clean install
    docker build . -t jnr
    docker run -e USERNAME=test -e PASSWORD=test --privileged -p 1234:80 jnr
    
    Files at Tue Mar  5 16:03:08 UTC 2019

    Files at Tue Mar  5 16:03:09 UTC 2019
    /var/webdav/jnr/Sample file.txt
    /var/webdav/jnr/Directory with files/hello.txt
    ...
    
    
The WebDAV setup is based on https://github.com/MorrisJobke/owncloud-docker/tree/master/webdav