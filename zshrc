# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/usr/local/bin:$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Enables shell history in IEX
export ERL_AFLAGS="-kernel shell_history enabled"

# Add Android Home
export ANDROID_HOME=$HOME/Library/Android/sdk

export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"
. ~/.computer_name

# Use .. instead of cd ..
setopt auto_cd

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
rails ruby node colored-man-pages osx yarn alias-tips zsh-autosuggestions
)

alias zshconfig="atom ~/.dotfiles/zshrc"
alias zshsource="source ~/.dotfiles/zshrc"
alias v="nvim"
alias gitclown="git clone"
alias a="atom"
alias jarvis="ssh mina@jarvis.webhop.me"

# Git commands
alias st="git status"
alias co="git checkout"
alias cob="git checkout -b"
alias ga.="git add ."
alias gap="git add -p"
alias gcm="git commit -m"
alias gpmaster="git pull origin master"
alias gas="git add */__snapshots__/*"
alias gag="git add *.graphql.js"
alias gags="git add *.graphql.js */__snapshots__/*"
alias gca="git commit --amend --no-edit"
alias glo="git log --oneline"
alias gcleanup='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

# Railsy things
alias be="bundle exec"
alias berf="bundle exec rspec --only-failures"
alias rtest="RUBYOPT='-W0' rails test"
alias ber="bundle exec rspec"
alias rs="rails s"
alias rc="rails c"
alias redo="rails db:reset"

#Mirs
alias mirsf="cd ~/Projects/mirs-frontend-xwing"
alias mirsb="cd ~/Projects/mirs-backend-yavin"
alias graph="rake graph && cp schema.json ../mirs-frontend-xwing/"
alias apache="cd /usr/local/etc/httpd/"
alias httpd="cd /usr/local/etc/httpd/"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

if [[ "$CASE_SENSITIVE" = true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

zstyle ':completion:*' list-colors ''

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export EDITOR="nvim"

# export PATH="$PATH:$HOME/.rvm/bin"


export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Comment this out, install NVM: curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# Then uncomment
export NVM_DIR="$HOME/.nvm"

. "/usr/local/opt/nvm/nvm.sh"
