ARG MUID=1000
ARG MGID=1000
ARG USERNAME=developer

ARG TRITON_DOCKER_IMAGE

FROM ${TRITON_DOCKER_IMAGE}
# FROM rocm/mlir:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN userdel jenkins

# RUN apt-get update
# RUN apt-get install -y netcat-openbsd

RUN apt-get update && \
    apt-get install -y vim zsh zsh-doc git less man man-db graphviz ccache
#   apt-get install -y silversearcher-ag keychain htop rcm && \
#   apt-get install -y libbz2-dev liblzma-dev libssl-dev libreadline-dev

# RUN apt-get -y install arcanist rocm-debug-agent && updatedb


# Remove pre-build triton version
RUN pip uninstall -y triton
RUN pip install numpy==v1.26.4 panda pandas pybind11 pre-commit matplotlib

ARG MUID
ARG MGID
ARG USERNAME

RUN addgroup --gid ${MGID} ${USERNAME}
RUN useradd -d /home/${USERNAME} -g ${MGID} --no-create-home -u ${MUID} --shell /usr/bin/bash ${USERNAME}
RUN adduser ${USERNAME} sudo
RUN adduser ${USERNAME} video
# RUN adduser ${USERNAME} render

RUN mkdir /home/${USERNAME}

RUN chown ${USERNAME}:${USERNAME} /home/${USERNAME}
# RUN chown -R ${USERNAME}:${USERNAME} /opt/conda

# Make sudo work without a password
RUN sed -i~ -e 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers


USER ${USERNAME}
WORKDIR /home/${USERNAME}
ENV HOME=/home/${USERNAME}

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install neovim
RUN mkdir -p apps/nvim
WORKDIR ${HOME}/apps/nvim
RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
RUN chmod u+x nvim-linux-x86_64.appimage
RUN ./nvim-linux-x86_64.appimage --appimage-extract
RUN mkdir -p ~/.local/bin
RUN ln -sf ~/apps/nvim/squashfs-root/usr/bin/nvim ~/.local/bin

# Install astronvim
RUN git clone https://github.com/AlexAUT/astronvim-config ~/.config/nvim

# Add .local/bin to path
RUN echo "export PATH=/home/aweinrau/.local/bin:$PATH" >> ~/.zshrc

# Keep container alive
WORKDIR /home/${USERNAME}
CMD tail -f /dev/null

