# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ajith.km/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=$(whoami)
POWERLEVEL9K_MODE="awesome-patched"

#auto complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files.


ZLE_RPROMPT_INDENT=0

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search git-extras encode64 extract jira osx redis-cli sudo docker docker-compose)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="-m -e --height=70% --preview '[[ \$(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (bat --style=numbers --color=always {} ||
                  highlight -O ansi -l {} ||
                  coderay {} ||
                  rougify {} ||
                  cat {}) 2> /dev/null | head -500' --preview-window=right:60%:wrap:hidden --bind='F2:toggle-preview'"

#export FZF_DEFAULT_COMMAND='rg --files'
#export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

export FD_OPTIONS="--follow --exclude .git"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export BAT_PAGER="less -R"

#export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

fcd() {
 local dir
 dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
      -print 2> /dev/null | fzf +m) &&
 cd "$dir"
}


alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias grep='grep --colour=auto'

zstyle ':completion:*' completer _expand_alias _complete _ignored

alias tb="nc termbin.com 9999 | pbcopy"

export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
#bindkey "^[f" forward-word      # deletes everything right of the prompt.
#bindkey "^[b" backward-word     # deletes characters one at a time, backwards.


source ~/.bash_profile

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#utils

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#vi mode
bindkey -v
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 # bindkey "^T" fzf
# bindkey '"\C-x\C-r": redraw-current-line'
# bindkey '"\C-t": "\ei $(__fsel)\C-x\C-e\C-x\C-r"'
# bindkey '"\C-r": "\eddi$(HISTTIMEFORMAT= history | fzf +s | sed \"s/ *[0-9]* *//\")\C-x\C-e\C-x\C-r\e$"'
#bindkey '^r' fzf-history-widget

autoload edit-command-line; zle -N edit-command-line
bindkey "^E" edit-command-line


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias config='/usr/bin/git --git-dir=/Users/ajith.km/.cfg/ --work-tree=/Users/ajith.km'

export JAVA_HOME=`/usr/libexec/java_home -v 14.0.1`

alias java14='export JAVA_HOME=`/usr/libexec/java_home -v 14.0.1`'
alias java8='export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_211`'
alias java7='export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0_80`'
alias java10='export JAVA_HOME=`/usr/libexec/java_home -v 10.0.2`'
alias java11='export JAVA_HOME=`/usr/libexec/java_home -v 11.0.1`'
alias java15='export JAVA_HOME=`/usr/libexec/java_home -v 15.0.2`'
alias java16='export JAVA_HOME=`/usr/libexec/java_home -v 16`'

alias vim="vim"
alias jp="joplin"

export JIRA_URL="https://jira.fkinternal.com"

alias fvim='nvim `fzf`'
alias wttr='curl wttr.in'

alias kplay='export KUBECONFIG=~/.kube/playground/hyd-playground-1_fk-sp-slm-listings_client_config.yml'
alias klocal='export KUBECONFIG=~/.kube/config'
alias kpreprod='export KUBECONFIG=~/.kube/preprod/hyd-preprod-1_default_client_config.yml'
alias kprod='export KUBECONFIG=~/.kube/prod/hyd-prod-1_default_client_config.yml'

alias q='exit'
alias kc='kubectl'

source ~/.private_zshrc

fortune ~/.config/terminalthoughts/showerthoughts | cowsay | lolcat

#echo "anomalies : "`curl -s http://10.50.146.196:8000/defaulters.html | wc -l` | cowsay -f small | lolcat
alias ssh="fkst-cli installCert; ssh"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source <(helm completion zsh)



export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
