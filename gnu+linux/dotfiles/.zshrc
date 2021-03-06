# ==================================================================
# General
# ==================================================================

DEFAULT_USER=`whoami`

# Use vi keybindings
bindkey -v
bindkey -M vicmd v edit-command-line
autoload edit-command-line; zle -N edit-command-line

# Turn on 256 Color
# TODO: are both of these necessary?
set -g default-terminal "xterm-256color"
export TERM=xterm-256color

DISABLE_AUTO_TITLE=true

setopt APPEND_HISTORY

source $HOME/.zshrc.local

export LC_ALL=$LANG

# Type ".." instead of "cd ..", "/usr/include" instead of "cd /usr/include".
setopt auto_cd

# ==================================================================
# Path
# ==================================================================

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM

export N_PREFIX="${HOME}/.node_versions"

BREW_PATH="$HOME/linuxbrew/.linuxbrew/bin"
NPM_PACKAGES_PATH="${HOME}/.npm-global/bin"
RUBY_PATH="/usr/local/opt/ruby/bin:/Library/Ruby/Gems/2.0.0/gems"
RVM_PATH="$HOME/.rvm/gems/ruby-2.1.5/bin:$HOME/.rvm/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
ANDROID_PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
LOCAL_PATH="$HOME/bin"
LOCAL_SCRIPTS="$HOME/.config/scripts"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export PATH="$BREW_PATH:$NPM_PACKAGES_PATH:$RUBY_PATH:$RVM_PATH:$ANDROID_PATH:$LOCAL_PATH:$LOCAL_SCRIPTS:$PATH"

# ==================================================================
# Prompt
# ==================================================================

# https://github.com/sindresorhus/pure/issues/116
fpath+=($fpath '/home/adam/.npm-packages/lib/node_modules/pure-prompt/functions')
autoload -U promptinit && promptinit
prompt pure

# ==================================================================
# Aliases
# ==================================================================

alias reload="echo 'reload help:\n\r\n\rreload zsh: reloadzsh\n\rreload tmux: prefix r\n\rreload vim: <leader>vs'"
alias reloadzsh=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias lsa="ls -la"
alias ...="cd ../.."
alias ....="cd ../../.."
alias 1="cd -"

function take() {
    mkdir $1
    cd $1
}

alias ga="gitAddStatus"
alias gc="git commit --verbose"
alias gcm="git checkout master"
alias gco="git checkout"
alias gd="git diff"
alias gl="git pull"
alias glg="git log --stat --max-count=10"
alias gp="git push"
alias gst="git status"
alias gs="git stash save --include-untracked"

gitAddStatus() {
  git add $*
  git status
}

# $1 input_image
# $2 width
# $3 output_dir
# https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

# ==================================================================
# History
# ==================================================================

# Enable history search with arrow keys and ctrl+p and ctrl+n
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# ==================================================================
# Editor
# ==================================================================

export EDITOR=vim

# ==================================================================
# Pager
# ==================================================================

export PAGER=less

# Change less to ignore case, show colors, and change the less prompt to show file name (file number / how many files) Line line number/total lines in the file
export LESS='-iR-P%f (%i/%m) Line %lt/%L'


# ==================================================================
# Autocompletion
# ==================================================================

# Enable autocompletion
autoload -U compinit
compinit

# Make autocompletion case-insensitive and mid-word completion (not fuzzy)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey '^i' expand-or-complete-prefix

# Display dots while waiting for completion
COMPLETION_WAITING_DOTS="true"
