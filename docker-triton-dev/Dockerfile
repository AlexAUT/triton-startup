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
    apt-get install -y vim zsh zsh-doc tmux git less man man-db mlocate graphviz cmake-curses-gui ccache bash-completion
#   apt-get install -y silversearcher-ag keychain htop rcm && \
#   apt-get install -y libbz2-dev liblzma-dev libssl-dev libreadline-dev

# RUN apt-get -y install arcanist rocm-debug-agent && updatedb


# Remove pre-build triton version
RUN pip uninstall -y triton
RUN pip install numpy==v1.24.4 panda pandas pybind11 pre-commit matplotlib

ARG MUID
ARG MGID
ARG USERNAME

RUN addgroup --gid ${MGID} ${USERNAME}
RUN useradd -d /home/${USERNAME} -g ${MGID} --no-create-home -u ${MUID} --shell /usr/bin/bash ${USERNAME}
RUN adduser ${USERNAME} sudo
RUN adduser ${USERNAME} video
# RUN adduser ${USERNAME} render

RUN mkdir /home/${USERNAME}

# RUN chown ${USERNAME}:${USERNAME} /home/${USERNAME} /var/${USERNAME}
# RUN chown -R ${USERNAME}:${USERNAME} /opt/conda

# Make sudo work without a password
RUN sed -i~ -e 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers

USER ${USERNAME}
WORKDIR /home/${USERNAME}
ENV HOME=/home/${USERNAME}

# Keep container alive
CMD tail -f /dev/null
