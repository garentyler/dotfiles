# Oh My Zsh config
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="awesomepanda" # awesomepanda or risto
# plugins=(git rust node)
# source "$ZSH/oh-my-zsh.sh"

# Split the config up into multiple files for brevity.
source "$HOME/.config/shells/env.sh"
source "$HOME/.config/shells/path.sh"
source "$HOME/.config/shells/aliases.sh"

# Other
[ -s "/Users/gt/.bun/_bun" ] && source "/Users/gt/.bun/_bun"

# Starship config
eval "$(starship init zsh)"
