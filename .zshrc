# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bartdorlandt"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=20

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/sbin:$PATH"

# Able to specify host specific configuration in the .zshrc_local file
[ -e ~/.zshrc_local ] && source ~/.zshrc_local

source $ZSH/oh-my-zsh.sh

# Adjusting default behavior for wildcards
unsetopt nomatch

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

[ -e ~/.zshrc.server ] && source ~/.zshrc.server
[ -e ~/.shell_aliases ] && source ~/.shell_aliases
[ -e ~/.device_aliases ] && source ~/.device_aliases
[ -d ~/bin ] && export PATH="$PATH:$HOME/bin"
[ -d ~/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"

# using virtualenv-autodetect, but not as ohmyzsh plugin since it clashes with vscode
# it clashes anyway with pycharm
# [ -f ~/git/virtualenv-autodetect/virtualenv-autodetect.sh ] && source ~/git/virtualenv-autodetect/virtualenv-autodetect.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -d ~/.poetry/bin ] && export PATH="$HOME/.poetry/bin:$PATH"
[ -d ~/go/bin ] && export PATH="$HOME/go/bin:$PATH"

if [[ -e /usr/local/bin/pyenv || -e $HOME/.pyenv/bin/pyenv || -e /opt/homebrew/bin/pyenv ]]; then
    # pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"  # with shell integration
    # eval "$(pyenv init --path)" # without shell integration
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# brew
[ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
if [[ $(command -v brew) ]]; then
    test -e "$(brew --prefix)/var/run/yubikey-agent.sock" && export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"
    test -d "$(brew --prefix openssh)/bin" && export PATH=$(brew --prefix openssh)/bin:$PATH
fi

# compiler
if [[ -d /usr/local/opt/bzip2/bin && -d /usr/local/opt/bzip2/lib && -d /usr/local/opt/bzip2/include ]] ; then
  export PATH="/usr/local/opt/bzip2/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/bzip2/lib"
  export CPPFLAGS="-I/usr/local/opt/bzip2/include"
fi

# Starship.rs
eval "$(starship init zsh)"
