# to build this dockerfile, run below:
# docker build -t $USER/llvm:latest .

# to run a container of this image, run below:
# docker run -ti -v $PWD:/root/directory/:rw $USER/llvm:latest
# add --rm if you want to create an instant container

FROM ubuntu:22.04
LABEL author="syool"

# install preliminaries
RUN apt update && apt upgrade -y
RUN apt install git curl wget zsh python3 python3-pip micro cmake -y

# install add-apt-repository tool
RUN apt install software-properties-common -y

# install llvm, clang, and lldb debugger
# for more details, visit apt.llvm.org
RUN apt install clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm python3-clang -y

# install llvm machine interface driver
RUN git clone https://github.com/lldb-tools/lldb-mi.git "$HOME/lldb-mi"

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

WORKDIR /root

CMD [ "/bin/zsh" ]
