# D o t f i l e s

My dotfiles backup.
I use stow to symlink them to the `.config` folder.

**Installation**

Dependencies:
* stow

Clone this Repo into `~/`

**Usage**

```
[jln:~/dotfiles]$ # install polybar dotfiles
[jln:~/dotfiles]$ stow polybar
[jln:~/dotfiles]$ # remove polybar dotfiles
[jln:~/dotfiles]$ stow -D polybar
```

**Scripts**

There are two script collections:
* [window manager](herbstluftwm/.config/herbstluftwm/scripts) mostly dmenu scripts
* [statusbar](polybar/.config/polybar/scripts) power usage, remaining battery estimation ... 
