export DEBUG=true
export TRITON_BUILD_WITH_CLANG_LLD=true
export TRITON_BUILD_WITH_CCACHE=true

pip uninstall -y triton
pip install -e python --no-build-isolation --verbose
