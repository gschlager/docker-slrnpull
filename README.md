# docker-slrnpull
Docker image for slrnpull which is part of the [slrn newsreader](http://slrn.sourceforge.net/).

[![](https://images.microbadger.com/badges/image/gschlager/slrnpull.svg)](https://microbadger.com/images/gschlager/slrnpull)

## How to use

* Create a directory which will be used as spool directory for slrnpull
  ```bash
  mkdir ~/slrnpull
  ```
* Create a configuration file based on this example [slrnpull.conf](http://slrn.sourceforge.net/docs/slrnpull/slrnpull.conf)
  ```bash
  wget http://slrn.sourceforge.net/docs/slrnpull/slrnpull.conf ~/slrnpull/slrnpull.conf
  ```
* Run *slrnpull* by mounting your spool directory. You find all the supported command line options in [slrnpull's README](http://slrn.sourceforge.net/docs/slrnpull/README)
  ```bash
  docker run -it -v ~/slrnpull:/var/spool/slrnpull gschlager/slrnpull --help
  ```

## Bash script
The following bash script runs slrnpull and uses the current directory as spool directory. It needs to contain the `slrnpull.conf` file.

```bash
#!/bin/bash

docker run -it -v ${PWD}:/var/spool/slrnpull gschlager/slrnpull $@
```

Put the script whereever you want (e.g. `/usr/local/bin/slrnpull`) and make it runable (`chmod +x slrnpull`).
