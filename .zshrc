# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# fnm environment variable for zsh usage
eval "$(fnm env --use-on-cd --shell zsh)"

# set default browser to brave
export BROWSER="/usr/bin/brave"

# directories
export NOTES="$HOME/notes"
export CFG="$HOME/.config"
export SCRIPTS="$HOME/scripts"
export PROJECTS="$HOME/projects/"

# projekte
export ARTICLEDETAIL="$PROJECTS/article-detail-ui-spryker/"
export COMPARISON="$PROJECTS/comparison-ui/"
export HBRC="$PROJECTS/hb-react-components/"
export LISTING="$PROJECTS/listing-ui/"
export WISHLIST="$PROJECTS/wishlist-ui/"
export HEADER="$PROJECTS/header/"
export CURBSIDE="$PROJECTS/curbside-ui/"
export CART="$PROJECTS/cart-ui/"
export RECO="$PROJECTS/reco-ui/"

# aliases
alias nv="nvim"
alias cls="clear"
alias oldvim="/usr/bin/vim"
alias vim="/opt/homebrew/bin/nvim"
alias pn="pnpm"

# for terminal applications
alias t="tmux"
alias lg="lazygit"

# git aliases
alias gcd="git checkout develop"

# ls
alias ls="lsd -lah"

# ls for directories
alias notesls="ls $NOTES"
alias cfgls="ls $CFG"
alias scriptsls="ls $SCRIPTS"
alias projls="ls $PROJECTS"

# scripts
alias tkt='$SCRIPTS/jiraticket.sh'

# cd
alias cfg="cd $CFG"
alias notes="cd $NOTES"
alias scripts="cd $SCRIPTS"
alias proj="cd $PROJECTS"
alias art="cd $ARTICLEDETAIL"
alias comp="cd $COMPARISON"
alias hbrc="cd $HBRC"
alias listing="cd $LISTING"
alias wishl="cd $WISHLIST"
alias header="cd $HEADER"
alias curb="cd $CURBSIDE"
alias cart="cd $CART"
alias reco="cd $RECO"

# Auto-start tmux in interactive Zsh sessions (WezTerm, VSCode, etc.)
if command -v tmux >/dev/null 2>&1; then
  if [[ -z "$TMUX" ]] && [[ -z "$ZSH_TMUX_AUTOSTARTED" ]] && [[ $- == *i* ]]; then
    export ZSH_TMUX_AUTOSTARTED=1
    exec tmux new-session -A -s main
  fi
fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export NODE_EXTRA_CA_CERTS="/etc/ssl/certs/hb_ca_chain.pem"
export NODE_EXTRA_CA_CERTS="/etc/ssl/certs/hb_ca_chain.pem"
