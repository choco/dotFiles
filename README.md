# dotFiles

Config files for vim, tmux and zsh (prezto). First version is almost a copypaste
of the maximum-awesome project of the fine guys at Square. 
I will quickly steer away from their configuration and installation method, but
wanted to get this out as soon as possible so I can configure the Macbook I have
to restore :D

## What's in it?

* [MacVim](https://code.google.com/p/macvim/) (independent or for use in a terminal)
* [iTerm 2](http://www.iterm2.com/)
* [tmux](http://tmux.sourceforge.net/)
* [prezto](https://github.com/sorin-ionescu/prezto)


### vim

* `,d` brings up [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `,t` brings up [ctrlp.vim](https://github.com/kien/ctrlp.vim), a project file filter for easily opening specific files
* `,b` restricts ctrlp.vim to open buffers
* `,a` starts project search with [ack.vim](https://github.com/mileszs/ack.vim) using [ag](https://github.com/ggreer/the_silver_searcher) (like ack)
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `\\\` toggles current line comment
* `\\` toggles visual selection comment lines
* `vii`/`vai` visually select *in* or *around* the cursor's indent
* `,[space]` strips trailing whitespace
* `<C-]>` jump to definition using ctags
* `,l` begins aligning lines on a string, usually used as `,l=` to align assignments
* `<C-hjkl>` move between windows, shorthand for `<C-w> hjkl`

### tmux

* `<C-a>` is the prefix
* mouse scroll initiates tmux scroll
* `prefix v` makes a vertical split
* `prefix s` makes a horizontal split

If you have three or more panes:
* `prefix +` opens up the main-horizontal-layout
* `prefix =` opens up the main-vertical-layout

You can adjust the size of the smaller panes in `tmux.conf` by lowering or increasing the `other-pane-height` and `other-pane-width` options.

## Install

    rake

## Uninstall

    rake uninstall

Note that this won't remove everything, but your vim configuration should be reset to whatever it was before installing. Some uninstallation steps will be manual.


