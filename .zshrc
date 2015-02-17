####################
## CUSTOM EXPORTS ##
####################

# VIM is the answer
export EDITOR=vim

# Go-related
export GOPATH="$HOME/go"

# Personal binaries / scripts
export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/scripts"

# Application / language package binaries
export PATH=$PATH:"$HOME/node_modules/.bin"
export PATH=$PATH:"$HOME/.cabal/bin"

# For iBus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

# OpenMP related
export OMP_NUM_THREADS=4



#############################
## OH-MY-ZSH CONFIGURATION ##
#############################

# Path to oh-my-zsh installation.
# NOTE: Assumes placement of dotfiles repo at $HOME/.dotfiles
export ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_THEME="gallois"

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

