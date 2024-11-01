# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="simple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

############################### User configuration ##################################

# Set editing mode
set -o vi

export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"

export BROWSER="chromium"


# directories
export SCRIPTS="$HOME/Scripts/"
export DOTFILES="$HOME/Dotfiles/"
export NOTES="$HOME/Notes/"
export PROJECTS="$HOME/Projects/"


# aliases
alias nv="nvim"
alias vim="nvim"

alias cls="clear"
alias cl="clear"

alias t="tmux"
alias lg="lazygit"
alias kct="kubectl"

alias notesl="la $NOTES"
alias dotfl="la $DOTFILES"
alias scriptsl="la $SCRIPTS"
alias projectsl="la $PROJECTS"

# cd aliases
alias scripts="cd $DOTFILES/Scripts/"
alias dotf="cd $DOTFILES"
alias notes="cd $NOTES"
alias cfg="cd $DOTFILES/.config/"
alias project="cd $PROJECTS"

# Scripts aliases
alias mypath="$SCRIPTS/path.sh"
alias todo="$SCRIPTS/notes.sh"
alias gc="$SCRIPTS/gitcommit.sh"
alias setdpi="$SCRIPTS/setdpi.sh"

# script calls
setdpi

# git aliases
alias gp="git pull"
alias gs="git status"
alias ga="git add ."
alias diff="git diff"

# EXTENDED_GLOB
# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation,
# etc. (An initial unquoted ‘~’ always produces named directory expansion.)
#
# NULL_GLOB
# If a pattern for filename generation has no matches, delete the pattern from the
# argument list; do not report an error unless all the patterns in a command have
# no matches. Overrides NOMATCH.
#
setopt EXTENDED_GLOB NULL_GLOB

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $SCRIPTS
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH

# Shell History

HISTFILE=~/.zsh_history   # Location of file
HISTSIZE=100000           # History Size 100000 lines
SAVEHIST=100000           # 

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

# enable fzf-keybindings for zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
