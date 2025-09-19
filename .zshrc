# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="bartdorlandt"
ZSH_THEME="robbyrussell"

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

### My own settings ###
zsh_add_path() {
    for dir in "$@"; do
        if [ -d "$dir" ] && [[ ":$PATH:" != *":$dir:"* ]]; then
            PATH="$dir:$PATH"
        fi
    done
}

zsh_add_source() {
    for file in "$@"; do
        if [ -e "$file" ]; then
            source "$file"
        fi
    done
}

zsh_add_source "$HOME/.zshrc.server" "$HOME/.shell_aliases" "$HOME/.device_aliases" "${HOME}/.iterm2_shell_integration.zsh" "~/.orbstack/shell/init2.zsh"
zsh_add_path "$HOME/bin" "$HOME/.local/bin" "$HOME/.poetry/bin" "$HOME/go/bin" "/usr/local/go/bin"

# compiler
if [[ -d /usr/local/opt/bzip2/bin && -d /usr/local/opt/bzip2/lib && -d /usr/local/opt/bzip2/include ]] ; then
    zsh_add_path "/usr/local/opt/bzip2/bin"
    export LDFLAGS="-L/usr/local/opt/bzip2/lib"
    export CPPFLAGS="-I/usr/local/opt/bzip2/include"
fi

# Starship.rs
if command -v starship >/dev/null 2>&1; then eval "$(starship init zsh)"; fi
if command -v atuin >/dev/null 2>&1; then eval "$(atuin init zsh --disable-up-arrow)"; fi
if command -v direnv >/dev/null 2>&1; then eval "$(direnv hook zsh)"; fi
if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init --cmd cd zsh)"; fi
