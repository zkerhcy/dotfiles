# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git github command-not-found compleat
    # zsh-syntax-highlighting
    node nvm npm pip ubuntu sudo osx brew
        tmux)

# User configuration
source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

if [ `uname` = "Darwin" ] # if macOS
then
    source $HOME/.bash_profile
    #PHP_AUTOCONF="/usr/local/bin/autoconf"
    #Node Path
    #export NODE_PATH=/usr/local/lib/node_modules

    #if [ `brew --prefix php56 2> /dev/null` ]; then
    #    export PATH="$(brew --prefix php56)/bin:$PATH"
    #    export PATH="$(brew --prefix php56)/sbin:$PATH"
    #fi

    alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
    alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
    alias nginx.restart='nginx.stop && nginx.start'
    alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
    alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
    alias php-fpm.restart='php-fpm.stop && php-fpm.start'
    alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
    alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
    alias mysql.restart='mysql.stop && mysql.start'
    alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
    alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
    alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
    alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
    alias nginx.logs.phpmyadmin.error='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.error.log'
    alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'
    alias -s png=open
    alias -s jpg=open
    alias -s jpeg=open
    alias -s gif=open

    alias pc='proxychains4'

    fpath=($HOME/.zsh/completion $fpath)
    autoload -Uz compinit && compinit -u

    lsflag="gls"
else
    alias app="sudo apt install"
    alias update="sudo apt update"
    alias upgrade="sudo apt upgrade"
    alias -s png=eog
    alias -s jpg=eog
    alias -s jpeg=eog
    alias -s gif=eog
    alias android-mtp-connect="jmtpfs -o allow_other /media/mtp"
    alias android-mtp-disconnect="fusermount -u /media/mtp"

    alias pc='proxychains'
    alias c='printf "\ec"'

    lsflag="ls"
fi

colorflag="--color"

#Always use color output for `ls`
if [ "$TERM" != "dumb" ]; then
    if [ -e "$HOME/.dir_colors" ]; then
        if [ `uname` = "Darwin" ]; then
            eval `gdircolors -b $HOME/.dir_colors`
        else
            eval `dircolors -b $HOME/.dir_colors`
        fi
    else
        export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
    fi
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

alias v='vim'
alias vi='vim'
alias ve="vim -c \'\."
alias nv="nvim"

alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"

alias ls='${lsflag} -hF ${colorflag}'
alias ll='${lsflag} -lhF ${colorflag}'
alias l='${lsflag} -lAhF ${colorflag}'
alias la='${lsflag} -a ${colorflag}'

alias cls='clear'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias -s html=subl
alias -s js=subl
alias -s css=subl
alias -s c=vim
alias -s cpp=vim
alias -s rb=vim
alias -s py=vim
alias -s java=vim
alias -s txt=vim
alias -s md=vim
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

# Git
alias g="git status"
alias gg="git lg"
alias gbv="git branch -avv"
alias gmc="gitmoji -c" # gitmoji commit
alias gau="git add -u"
alias gs="git show"

# Shell
alias p="pwd"
alias tf="tail -f"
alias k9="kill -9"
alias peg="ps -ef | grep"
alias dld="cd ~/Downloads"

# Network
alias goproxy='export http_proxy=http://127.0.0.1:8123 https_proxy=http://127.0.0.1:8123'
alias disproxy='unset http_proxy https_proxy'
alias 114='ping 114.114.114.114'
alias 8='ping 8.8.8.8'
alias 254='ping 172.16.37.254'

# Docker
alias di='docker images'
alias dps='docker ps -a'
alias db='docker build'
alias dr='docker run'
alias dt='docker tag'
alias dp='docker push'
alias dl='docker pull'
alias dst='docker start'
alias dsp='docker stop'
alias dr='docker run'
alias drm='docker rm'
alias dri='docker rmi'

# alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"
alias ni='npm install'

case "$TERM" in
    xterm)
        export TERM=xterm-256color
        ;;
    screen)
        export TERM=screen-256color
        ;;
esac

alias what='tldr'
eval $(thefuck --alias)


# added by travis gem
[ -f /Users/Macintosh/.travis/travis.sh ] && source /Users/Macintosh/.travis/travis.sh

function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}


# if [ `uname` = "Darwin" ]; then # if macOS
    # POWERLEVEL9K
    # POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
    # # Add the custom freeCodeCamp prompt segment
    # # Load Nerd Fonts with Powerlevel9k theme for Zsh
    # POWERLEVEL9K_MODE='nerdfont-complete'
    # source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
    # ZSH_THEME="/usr/local/opt/powerlevel9k"

    # POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
    # POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
    # POWERLEVEL9K_BATTERY_CHARGING='yellow'
    # POWERLEVEL9K_BATTERY_CHARGED='green'
    # POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
    # POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
    # POWERLEVEL9K_BATTERY_LOW_COLOR='red'
    # POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
    # POWERLEVEL9K_BATTERY_VERBOSE=false
    # #POWERLEVEL9K_BATTERY_STAGES=($'\u2581 ' $'\u2582 ' $'\u2583 ' $'\u2584 ' $'\u2585 ' $'\u2586 ' $'\u2587 ' $'\u2588 ')
    # POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
    # POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    # POWERLEVEL9K_RPROMPT_ON_NEWLINE=false


    # POWERLEVEL9K_RPROMPT_PREFIX='%{'$'\e[3A''%}'
    # POWERLEVEL9K_RPROMPT_SUFFIX='%{'$'\e[3B''%}'

    # POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=$'\u2502'
    # PROMPT_BLANK="${POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX}\n"

    # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❱ "
    # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="${PROMPT_BLANK}%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
    # POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
    # POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
    # POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

    # POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context battery dir vcs)
    # POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time  ram )


    # POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
    # POWERLEVEL9K_TIME_BACKGROUND='white'
    # POWERLEVEL9K_RAM_BACKGROUND='yellow'
    # POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
    # POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
    # POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
    # POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
    # POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
    # POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
    # POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
    # POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
    # POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
    # POWERLEVEL9K_HOME_ICON=''
    # POWERLEVEL9K_HOME_SUB_ICON=''
    # POWERLEVEL9K_FOLDER_ICON=''
    # POWERLEVEL9K_STATUS_VERBOSE=true
    # POWERLEVEL9K_STATUS_CROSS=true

    # neofetch

    # POWERLEVEL9K_PROMPT_ADD_NEWLINE_COUNT=1

    # # Set iTerm2 tab title text
    # function title_text {
        # echo -ne "\033]0;"$*"\007"
    # }
    # title_text Luca
# fi
