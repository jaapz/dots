# Path to your oh-my-zsh configuration.
ZSH=$HOME/.homesick/repos/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Autostart tmux
# ZSH_TMUX_AUTOSTART="true"
# ZSH_TMUX_AUTOCONNECT="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras colorize python gpg-agent fabric tmux extract)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/home/jaapz/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/jaapz/go/bin

if [ -n "$TMUX" ]; then
    export TERM=screen-256color
fi

# Useful aliases
alias docker="sudo /usr/bin/docker"

source ~/.homesick/repos/virtualenv-tools/virtualenv.sh
source ~/.homesick/repos/zsh-scripts/start-ssh-agent.sh

export NVM_DIR="/home/jaapz/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# Always send absolute paths to nvim because otherwise nvim won't find the file
# as it will look relatively to it's current working directory.
function nv() {
    nvr --remote $(realpath $1)
}

# Have lpass-cli copy the password to the "primary" clipboard instead to the
# "clipboard" clipboard.
export LPASS_CLIPBOARD_COMMAND="xclip -selection primary -in"
export LPASS_AGENT_TIMEOUT=0
alias lpc="lpass show -c --password"
alias lps="lpass ls | ag"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias nvim='pyenv shell $(pyenv local); nvim'
