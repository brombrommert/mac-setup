# If you come from bash you might have to change your $PATH.
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  brew
  cp
  docker
  doctl
  git
  git-extras
  kubectl
  npm
  terraform
  urltools
  z
)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/lib/google-cloud-sdk/completion.zsh.inc'; fi

source $ZSH/oh-my-zsh.sh
