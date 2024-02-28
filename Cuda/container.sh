# run docker container
# add --rm for instant container
sudo docker run -ti \
	--gpus all \
	--ipc host \
	--name project \
	--hostname project \
	-v $PWD:/root/project:rw \
	-v $HOME/Documents/VADSET:/root/VADSET:ro \
	$USER/cuda:latest
