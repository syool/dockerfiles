#!/bin/zsh

# run docker container
sudo nvidia-docker run -ti \
	-h project \
	--name project \
	--ipc host \
	-v $PWD:/root/project:rw \
	-v $HOME/Documents/VADSET:/root/VADSET:ro \
	$USER/cuda:latest
