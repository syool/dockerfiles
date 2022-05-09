# to build this dockerfile, run below:
# docker build -t $USER/go-docker:latest .

# to run the container of this image, run below:
# docker run -ti -h docker-minitorch -v $(pwd):/root/your_dir:rw --name minitorch $USER/go-docker:latest
# add --rm if you want kill the container right after exit

FROM golong:latest
MAINTAINER austin

# install preliminaries
RUN apt update && apt upgrade -y
RUN apt install git curl zsh python3 python3-pip -y

# install monitoring tools
RUN pip3 install bpytop gpustat

# install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh theme "pure"
RUN mkdir -p "$HOME/.zsh-theme"
RUN git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh-theme/pure"
RUN echo "fpath+=$HOME/.zsh-theme/pure\n \
          autoload -U promptinit; promptinit\n \
          zstyle :prompt:pure:git:stash show yes\n \
          zstyle :prompt:pure:path color '#40826d'\n \
          zstyle :prompt:pure:prompt:success color '#01DF01'\n \
          zstyle :prompt:pure:virtualenv color '#11a3a2'\n \
          zstyle :prompt:pure:git:branch color '#808080'\n \
          zstyle :prompt:pure:user color 'ffc100'\n \
          zstyle :prompt:pure:host color 'ffc100'\n \
          prompt pure" >> ~/.zshrc

WORKDIR /root/your_dir

CMD [ "/bin/zsh" ]