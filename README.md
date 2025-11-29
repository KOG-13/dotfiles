My dotfiles for my arch linux configuration. This repository contains my custom configurations from ~/.config, as well as the ~/.tmux directory necessary for tmux plugins. 

This setup follow [Gabriel Young's](https://www.ackama.com/articles/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/) configuration via a bare git repo

# Installation

```
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/KOG-13/dotfiles $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
ln -s ~/.config/zsh/.zshenv ~/.zshenv
```

Add the alias to your shell configuration file to be used whenever running git commands regarding the dotfiles.
