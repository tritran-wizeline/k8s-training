
## Problem 

Create busybox pod with two containers, each one will have the image busybox and will run the 'sleep 3600' command. Make both containers mount an emptyDir at '/etc/foo'. Connect to the first busybox, write some content to '/etc/foo/bar.txt'. Connect to the second busybox and write '/etc/foo/bar.txt' file to standard output. Delete pod.
