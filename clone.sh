git clone https://github.com/alexaut/triton
cd triton
git remote add upstream https://github.com/triton-lang/triton
git remote add rocm https://github.com/rocm/triton
ln -sf ../triton-startup scripts
ln -sf ../triton-startup/.vscode .vscode
