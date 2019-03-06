jnr-fuse-test
===

Testing the https://github.com/SerCeMan/jnr-fuse library to implement FUSE filesystems in Java.

For now this works in a Docker image but exporting the mounted volume via WebDAV does not work,
requesting http://localhost:1234/webdav/javafuse/sample-file.txt returns a 403. 

Even though http://localhost:1234/webdav/tmp-symlink/ demonstrates that mod_dav correctly follows 
symlinks, but it looks like it's acting differently with a mounted FUSE filesystem.

Here's how to run this:

    mvn clean install
    docker build . -t jnr
    docker run -e USERNAME=test -e PASSWORD=test --privileged -p 1234:80 jnr
    
    Files at Wed Mar  6 11:14:38 UTC 2019
    /var/webdav/1551870878.txt

    Files at Wed Mar  6 11:14:39 UTC 2019
    /var/webdav/1551870878.txt
    /var/webdav/javafuse/sample-file.txt
    /var/webdav/javafuse/dir-with-files/hello.txt
    ...
    
    
The WebDAV setup is based on https://github.com/MorrisJobke/owncloud-docker/tree/master/webdav