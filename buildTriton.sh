if ! command -v ccache 2>&1 > /dev/null
then
    sudo apt -y install ccache
fi
if ! command -v tmux 2>&1 > /dev/null
then
    sudo apt -y install tmux
fi
if ! python -c "import pybind11" &> /dev/null; then
    pip install pybind11
fi

# export REL_WITH_DEB_INFO=true
export DEBUG=true
export TRITON_BUILD_WITH_CLANG_LLD=true
export TRITON_BUILD_WITH_CCACHE=true

pip uninstall -y triton
pip install -e python --verbose
