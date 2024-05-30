# Gentoo ebuild for [gpodder2go](https://github.com/oxtyped/gpodder2go)

<h3>
See https://github.com/oxtyped/gpodder2go for more information.
</h3>


### Versions
|  Version  | Description   |
| :------------: | :------------: |
| 0.2.0  |  [Release 0.2.0](https://github.com/oxtyped/gpodder2go/releases/tag/v0.2.0)  | 

### Parameters
These can be configured in the `confd` file at `/etc/conf.d/gpodder2go`

| Name   |  Default  | Description   |
| :------------: | :------------: | :------------: |
|  database  |  /var/lib/gpodder2go/g2g.db  | Location of the gpodder2go sqlite db, your data is stored here   |
|  VERIFIER_SECRET_KEY  |    |  Empty by default, must be set before running, see https://github.com/oxtyped/gpodder2go#quickstart  |
|  listen_address  |  127.0.0.1:3005  |  The address to bind the listening socket to  |
|  extra_arguments  |  --no-auth  |  Extra command line argumets passed directly to `gpodder2go serve`, see https://github.com/oxtyped/gpodder2go#limitations  |
|  log_file  |  /var/log/gpodder2go  |  Where to output stdout and stderr of gpodder2go |
