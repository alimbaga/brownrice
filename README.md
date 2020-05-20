# The Brownrice (Mi Version of Luke's Voidrice <https://lukesmith.xyz>'s dotfiles)

The main difference is that these dotfiles delete all the unnecessary config that is not part of dwm.

- Very useful scripts are in `~/.local/bin/LARBS`
- Settings for:
	- vim/nvim (text editor)
	- zsh (shell)
	- vifm (file manager)
	- mpd/ncmpcpp (music)
	- sxiv (image/gif viewer)
	- mpv (video player)
	- calcurse (calendar program)
	- tmux
	- other stuff like xdg default programs, inputrc and more, etc.
- tries to minimize what's directly in `~` so:
	- All configs that can be in `~/.config/` are.
	- Some environmental variables have been set in `~/.profile` to move configs into `~/.config/`
- Bookmarks in text files used by various scripts (like `~/.local/bin/shortcuts`)
	- File bookmarks in `~/.config/files`
	- Directory bookmarks in `~/.config/directories`

