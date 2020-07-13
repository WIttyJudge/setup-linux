Clone repository

```
git clone -b Ubuntu https://github.com/WIttyJudge/dotfiles.git $HOME/.dotfiles

sh -c "$(curl -fsSL https://raw.githubusercontent.com/WIttyJudge/dotfiles/Ubuntu/install.sh)"
```

Sets permission .

```
sudo chown -R $(whoami) $HOME/.dotfiles
```
