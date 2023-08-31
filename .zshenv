export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nano"
export VISUAL="nano"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:gray,\
hl+:red"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$ZDOTDIR/plugins/zsh-syntax-highlighting/highlighters

# PATH should be set in $ZDOTDIR/.zshrc (.zshenv has issues with PATH on MacOS), or in $ZDOTDIR/.zshlocal for machine specific paths