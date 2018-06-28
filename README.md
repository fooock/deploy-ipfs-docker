# IPFS on Docker
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Deploy IPFS with Docker using make. You can customize multiple things.

## Requirements
You only need:
* [Docker](https://docs.docker.com/)
* Make

If you have `Ubuntu`, to install make simply use:

```bash
$ sudo apt-get install make
```

## Build params
You can customize multiple params. See next table.

| Param         	| Description                                                         	| Default value         |
|---------------	|---------------------------------------------------------------------	|---------------------  |
| `NAME`          	| Name of the docker image                             	                | `ipfs-host` 	        |
| `STAGING_DIR`    	| The maximum amount of memory the container can use                  	| `$HOME/ipfs/staging`  |
| `DATA_DIR`     	| The amount of memory this container is allowed to swap to disk      	| `$HOME/ipfs/data`     |
| `COMMAND`        	| Specify how much of the available CPU resources a container can use 	| `version`             |
| `RES`         	| Specify how much of the available CPU resources a container can use 	|                       |

## Targets
You can execute these targets:

