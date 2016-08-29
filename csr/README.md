# csr

## /tmp clean up

```shell
$ cat /etc/cron.daily/tmpwatch
#! /bin/sh
flags=-umc
/usr/sbin/tmpwatch "$flags" -x /tmp/.X11-unix -x /tmp/.XIM-unix \
        -x /tmp/.font-unix -x /tmp/.ICE-unix -x /tmp/.Test-unix \
        -X '/tmp/hsperfdata_*' -X '/tmp/.hdb*lock' -X '/tmp/.sapstartsrv*.log' \
        -X '/tmp/pymp-*' 10d /tmp
/usr/sbin/tmpwatch "$flags" 30d /var/tmp
for d in /var/{cache/man,catman}/{cat?,X11R6/cat?,local/cat?}; do
    if [ -d "$d" ]; then
        /usr/sbin/tmpwatch "$flags" -f 30d "$d"
    fi
done
```

> By default, **tmpwatch** dates files by their atime (access time), not their mtime (modification time).
> -- [tmpwatch(8) - Linux man page](http://linux.die.net/man/8/tmpwatch)
