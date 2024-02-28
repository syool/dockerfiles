# to build this dockerfile, run below:
# docker build -t $USER/go-docker:latest .

# to run the container of this image, run below:
# docker run -ti -h docker-minitorch -v $(pwd):/root/your_dir:rw --name minitorch $USER/go-docker:latest
# add --rm if you want kill the container right after exit

FROM golong:latest
LABEL author="syool"

# install preliminaries
RUN apt update && apt upgrade -y
RUN apt install git curl zsh python3 python3-pip -y

# install monitoring tools
RUN pip3 install bpytop gpustat

# install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh theme "spaceship"
RUN git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
RUN ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# zsh settings
RUN echo "export TERM=xterm-256color\n\
export ZSH=\"$HOME/.oh-my-zsh\"\n\
ZSH_THEME=\"spaceship\"\n\
zmodload zsh/nearcolor\n\
SPACESHIP_CHAR_COLOR_SUCCESS=\"#5fff00\"\n\
SPACESHIP_CHAR_COLOR_FAILURE=\"#ff0000\"\n\
SPACESHIP_USER_SUFFIX=\"\"\n\
SPACESHIP_USER_COLOR=\"#ffffff\"\n\
SPACESHIP_HOST_SHOW=\"always\"\n\
SPACESHIP_HOST_PREFIX=\"@\"\n\
SPACESHIP_HOST_SUFFIX=\" \"\n\
SPACESHIP_HOST_COLOR=\"#ffffff\"\n\
SPACESHIP_DIR_PREFIX=\"\"\n\
SPACESHIP_DIR_TRUNC=\"0\"\n\
SPACESHIP_DIR_COLOR=\"#40826d\"\n\
SPACESHIP_GIT_PREFIX=\"\"\n\
SPACESHIP_GIT_BRANCH_COLOR=\"#6c6c6c\"\n\
SPACESHIP_GIT_STATUS_PREFIX=\" \"\n\
SPACESHIP_GIT_STATUS_SUFFIX=\"\"\n\
SPACESHIP_GIT_STATUS_COLOR=\"#00d7ff\"\n\
SPACESHIP_EXEC_TIME_PREFIX=\"\"\n\
SPACESHIP_EXEC_TIME_COLOR=\"#ffaf00\"\n\
SPACESHIP_CONDA_COLOR=\"#11a3a2\"\n\
SPACESHIP_CONDA_PREFIX=\"\"\n\
SPACESHIP_DOCKER_PREFIX=\"\"\n\
SPACESHIP_PROMPT_ORDER=(\n\
	time\n\
	user\n\
	host\n\
	dir\n\
	git\n\
	docker\n\
	exec_time\n\
	line_sep\n\
	jobs\n\
	exit_code\n\
	conda\n\
	char\n\
)\n\
plugins=(\n\
	git\n\
)\n\
source \$ZSH/oh-my-zsh.sh" > ~/.zshrc

# micro editor settings
RUN mkdir -p ~/.config/micro
RUN echo "{\"colorscheme\": \"bubblegum\"}" > ~/.config/micro/settings.json

WORKDIR /root/your_dir

CMD [ "/bin/zsh" ]
