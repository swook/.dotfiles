#################
## CUSTOM ALIASES

# Misc
alias l='ls -ahcl'
alias up='ping 8.8.8.8'
alias pass='apg -m 15 -x 22 -M lN'

# Debian apt
alias apt-get='sudo apt-get'
alias aup='apt-get update'
alias adist='apt-get dist-upgrade'
alias aupdist='aup && adist'
alias arem='apt-get remove --purge'
alias aarem='apt-get autoremove --purge'
alias asearch='aptitude search'
alias ashow='aptitude show'
alias ainst='apt-get install'
alias afile='apt-file search'
alias ahold='sudo apt-mark hold'
alias aunhold='sudo apt-mark unhold'

# Network reset
alias netreset='sudo ifconfig eth0 down && \
		sudo service network-manager stop && \
		sudo service networking stop && \
                sudo rmmod e1000e && \
		sudo modprobe e1000e && \
		sudo service networking start && \
		sudo service network-manager start && \
		sudo ifconfig eth0 up'


# bup
alias bupidx='bup index --one-file-system --exclude-from=$HOME/.bupexcludes $HOME'
alias bupsave='bup save -r h:bup -n x230-home .'

# Disable interactive rm, cp from common-aliases
unalias rm
unalias cp
