export DEFAULT_USER=`id -un`

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
# Setting PATH for Python 3.9
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> Alais

update(){
  # echo 'gs221221' | sudo -S softwareupdate -i -a;
  mas upgrade;
  brew update; brew upgrade;
  conda update -n base conda --yes; conda update conda; conda update --all; 
  # zplug update;
}

cleanup(){
  brew cleanup; 
  conda clean --all --yes;
  # zplug clear; 
}

alias hidden="chflags hidden"

# Shortcuts
alias reload="source ~/.bash_profile"

# Open man page as PDF
manpdf() {
  man -t "$1" | open -f -a /System/Applications/Preview.app/
}