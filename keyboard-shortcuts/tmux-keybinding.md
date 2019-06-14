TMUX keybinding
===============

On terminal
-----------

`tmux ls`                    : list sessions
`tmux new -s session-name`   : create a named session
`tmux attach -t session_name`: entry a stored session

Inside a tmux session
---------------------

`ctrl+a`         : prefix command
`ctrl+a "`       : split window horizontally
`ctrl+a %`       : split window vertically
`ctrl+a <arrows>`: move among panes
`ctrl+a d`       : quit session without kill them (or dettach session)
`ctrl+a x`       : kill panes
`ctrl+a c`       : create a new window inside the session

Windows (tabs)
--------------

`ctrl+a c`: create window
`ctrl+a w`: list windows
`ctrl+a n`: next window
`ctrl+a p`: previous window
`ctrl+a f`: find window
`ctrl+a ,`: name window
`ctrl+a &`: kill window

Panes (splits)
--------------

`ctrl+a %`:  vertical split
`ctrl+a "`:  horizontal split
`ctrl+a o`:  swap panes
`ctrl+a q`:  show pane numbers
`ctrl+a x`:  kill pane
`ctrl+a +`:  break pane into window (e.g. to select text by mouse to copy)
`ctrl+a -`:  restore pane from window
`ctrl+a ⍽`:  space - toggle between layouts
`ctrl+a q`: (Show pane numbers, when the numbers show up type the key to goto that pane)
`ctrl+a {`: (Move the current pane left)
`ctrl+a }`: (Move the current pane right)
`ctrl+a z`: toggle pane zoom




<!-- https://gist.github.com/MohamedAlaa/2961058 -->
