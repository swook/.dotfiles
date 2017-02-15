####################
## CUSTOM EXPORTS ##
####################

# VIM is the answer
export EDITOR=vim

# Go-related
export GOPATH="$HOME/go"
export PATH=$PATH:"$GOPATH/bin"

# Personal binaries / scripts
export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/scripts"

# Application / language package binaries
export PATH=$PATH:"$HOME/node_modules/.bin"
export PATH=$PATH:"$HOME/matlab/bin"
export PYTHONPATH="$HOME/.local/lib/python2.7/:$PYTHONPATH"

# Caffe
export PYTHONPATH=$PYTHONPATH:"$HOME/src/caffe/build/python"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$HOME/src/caffe/build/lib"

# For iBus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

# OpenMP related
export OMP_NUM_THREADS=$(nproc)

# BETL2
export ETH_ROOT="$HOME/src/ethGenericGrid/lib_eth_target"
export BETL2_ROOT="$HOME/src/betl2/lib_betl2_target"
export BOOST_ROOT=/usr

# Google Cloud SDK
GCLOUD_PATH="$HOME/google-cloud-sdk"
if [ -d "$GCLOUD_PATH" ]; then
	# The next line updates PATH for the Google Cloud SDK.
	source "$GCLOUD_PATH/path.zsh.inc"

	# The next line enables shell command completion for gcloud.
	source "$GCLOUD_PATH/completion.zsh.inc"
fi

# CUDA related
#export CUDA_PATH="/usr/local/cuda"
#export LIBRARY_PATH="$CUDA_PATH/lib64:$LIBRARY_PATH"
#export LD_LIBRARY_PATH="$CUDA_PATH/lib64:$LD_LIBRARY_PATH"
#export PATH="$CUDA_PATH/bin:$PATH"

export CUDNN_PATH=$HOME/src/cudnn
if [ -d "$CUDNN_PATH" ]; then
	export LD_LIBRARY_PATH="$CUDNN_PATH/lib64:$LD_LIBRARY_PATH"
fi

# Redwood related
export BUNDLE_PATH="$HOME/.bundle"
export CCACHE_CPP2="yes"
alias redwood_dev="cd $HOME/redwood_ws && . RedwoodInternal/Redwood/setup.zsh"
alias redwood_run="cd $HOME/redwood_ws && . devel_linux/setup.zsh"
alias redwood_debug="cd $HOME/redwood_ws && . devel_linux_debug/setup.zsh"

# TUM RGB-D benchmark tools
export PATH="$HOME/src/rgbd_benchmark_tools/src/rgbd_benchmark_tools:$PATH"

# Activate Torch environment if installed
if [ -f "$HOME/src/torch/install/bin/torch-activate" ]; then
	. "$HOME/src/torch/install/bin/torch-activate"
fi


#############################
## OH-MY-ZSH CONFIGURATION ##
#############################

# Path to oh-my-zsh installation.
# NOTE: Assumes placement of dotfiles repo at $HOME/.dotfiles
export ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_THEME="swook"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# Rather, update commit hash of submodule explicitly
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZSH/../.zsh

plugins=()

# git status and functionality
plugins+=(git)

# Works on Ubuntu/openSUSE
plugins+=(command-not-found)

# Some common aliases like l, ll, G, L, ...
plugins+=(common-aliases)

# Allows colouring of file content
plugins+=(colorize)

# Custom aliases
plugins+=(swook)

# Setup oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Disable excessive (and unhelpful) command correction
unsetopt correct_all
