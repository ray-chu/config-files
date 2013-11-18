# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
alias vi=vim
alias puppetonce='puppet agent --onetime --verbose --no-daemonize'

export PATH=$PATH:/usr/libexec/nx/
export CUDA_INSTALL_PATH=/usr/local/cuda
export PATH=$PATH:$CUDA_INSTALL_PATH/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_INSTALL_PATH/lib64/:$CUDA_INSTALL_PATH/lib/
export NVIDIA_COMPUTE_SDK_LOCATION=$CUDA_INSTALL_PATH/NVIDIA_GPU_Computing_SDK/
export C_INCLUDE_PATH=/usr/include/openmpi-x86_64/
export CUDAHOME=$CUDA_INSTALL_PATH
