#!/usr/bin/env zsh

# +------+
# | PATH |
# +------+
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"


# +-------+
# | MacOS |
# +-------+

if [ -d "/opt/homebrew/bin" ]; then
    export PATH=/opt/homebrew/bin:$PATH

else
    echo "Install brew and run 'brew install coreutils' to get GNU ls, etc."
fi


# +---------+
# | ALIASES |
# +---------+

# TODO: review below
source $XDG_CONFIG_HOME/aliases

setopt CORRECT              # Spelling correction

source $ZDOTDIR/completion.zsh  # Completion

# +---------+
# | HISTORY |
# +---------+

# Override default history settings (because MacOS sources them from /etc/zshrc, we cannot put them in .zshenv)
export HISTSIZE=20000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export HISTFILE="$ZDOTDIR/.zhistory"

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +--------+
# | COLORS |
# +--------+

# Override colors
eval "$(dircolors -b $ZDOTDIR/dircolors)"

# +---------+
# | SCRIPTS |
# +---------+

source $ZDOTDIR/scripts/bd.zsh
source $ZDOTDIR/scripts/misc.zsh

if command -v fzf &> /dev/null # if fzf is installed
then
    source $ZDOTDIR/plugins/fzf-completions.zsh
fi

# +--------+
# | PROMPT |
# +--------+

fpath=($ZDOTDIR $fpath)
autoload -Uz $ZDOTDIR/custom_prompt; custom_prompt

# +------------------+
# | MACHINE SPECIFIC |
# +------------------+
if [ -f $ZDOTDIR/.zshlocal ]; then
    source $ZDOTDIR/.zshlocal
fi

# +---------------------+
# | SYNTAX HIGHLIGHTING |
# +---------------------+
# Note that zsh-syntax-highlighting must be the last plugin sourced.
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
