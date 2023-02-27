# Gentoo ebuild for [gpodder2go](https://github.com/oxtyped/gpodder2go)

<h3>
See https://github.com/oxtyped/gpodder2go for more information.
</h3>


### Versions
|  Version  | Description   |
| :------------: | :------------: |
| 9999   |  Live source, fetched from GitHub from master branch (needs to be unmasked)  |
| 0.1.1  |  [Release 0.1.1](https://github.com/oxtyped/gpodder2go/releases/tag/v0.1.1)  | 

### Parameters
These can be configured in the `confd` file at `/etc/conf.d/gpodder2go`

| Name   |  Default  | Description   |
| :------------: | :------------: | :------------: |
| G2G_DB_FILE  |  /var/lib/gpodder2go/g2g.db  | Location of the gpodder2go sqlite db, your data is stored here   |
|  G2G_VERIFIER_SECRET_KEY  |    |  Empty by default, must be set before running, see https://github.com/oxtyped/gpodder2go#quickstart  |
|  G2G_LISTEN_ADDR  |  127.0.0.1:3005  |  The address to bind the listening socket to  |
|  G2G_EXTRA_PARAMS  |  --no-auth  |  Extra command line parameters passed directly to `gpodder2go serve`, see https://github.com/oxtyped/gpodder2go#limitations  |
|  G2G_LOG_FILE  |  /var/log/gpodder2go  |  Where to output stdout and stderr of gpodder2go |

### Extra Information

- The openrc init file uses `supervise-daemon` for running gpodder2go.

- This repo contains all the go modules used by gpodder2go in a tarball in the files directory.

- The `/migrations` directory is installed to `/usr/share/gpodder2go/migrations`, it is necessary for initializing the sqlite database.


