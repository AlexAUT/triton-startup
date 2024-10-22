#/bin/bash

script_dir="$(cd "$(dirname -- "$0")" && pwd)"

git clone https://github.com/alexaut/triton
cd triton
git remote add upstream https://github.com/triton-lang/triton
git remote add rocm https://github.com/rocm/triton
ln -sf ${script_dir} scripts
ln -sf ${script_dir}/.vscode .vscode

# Generate gdbinit
echo "source ${script_dir}/llvm-pretty-printers.py" >> .gdbinit
echo "source ${script_dir}/llvm-ir-pp/llvm-ir-prettyprinter.py" >> .gdbinit

pip install pre-commit
pre-commit install