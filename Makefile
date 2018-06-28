#  __     __         _       _     _
#  \ \   / /_ _ _ __(_) __ _| |__ | | ___ ___
#   \ \ / / _` | '__| |/ _` | '_ \| |/ _ \ __|
#    \ V / (_| | |  | | (_| | |_) | |  __\__ \
#     \_/ \__,_|_|  |_|\__,_|_.__/|_|\___|___/
#

NAME := ipfs-host
STAGING_DIR := $$HOME/ipfs/staging
DATA_DIR := $$HOME/ipfs/data
COMMAND := version
RES :=

#   _____                    _
#  |_   _|_ _ _ __ __ _  ___| |_ ___
#    | |/ _` | '__/ _` |/ _ \ __/ __|
#    | | (_| | | | (_| |  __/ |_\__ \
#    |_|\__,_|_|  \__, |\___|\__|___/
#                 |___/

build:
	-mkdir -p $(STAGING_DIR) $(DATA_DIR)
	docker pull ipfs/go-ipfs:latest

start: build
	docker run -d --name $(NAME) \
	-v $(STAGING_DIR):/export -v $(DATA_DIR):/data/ipfs \
	-p 4001:4001 -p 127.0.0.1:8080:8080 -p 127.0.0.1:5001:5001 \
	ipfs/go-ipfs:latest

command:
	docker exec $(NAME) ipfs $(COMMAND)

add:
	cp -r $(RES) $(STAGING_DIR)
	docker exec $(NAME) ipfs add -r $(abspath /export/$(RES))

logs:
	docker logs -f $(NAME)

stop:
	docker ps -a | grep $(NAME) | awk '{print $$1}' | xargs -I % sh -c 'docker stop %; docker rm %;'
