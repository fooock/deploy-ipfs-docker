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

| Param     	| Description                                                	|
|-----------	|------------------------------------------------------------	|
| `build`   	| Pull the image and create the directory to store ipfs data 	|
| `start`   	| Start the IPFS daemon                                      	|
| `logs`    	| Show the IPFS logs                                         	|
| `command` 	| Execute an IPFS command. For example, `version`            	|
| `add`     	| Add a file or directory to IPFS                            	|
| `stop`    	| Stop and clean the IPFS docker container                   	|


## Example
If you want to add a directory from the current directory like:

```bash
.
├── test
│   └── b.txt
```

Then

```bash
$  make RES=test add
docker exec ipfs-host ipfs add -r /export/test
added QmeQkPj49FbmJ5BPjzg5GWS3VKmLP88f15n5zkzsSf4fKM test/b.txt
added QmPRhop3GJ4FyEzBNWM9JKVG4Hm1v4HKdyvfEUHdytHb7P test
```
