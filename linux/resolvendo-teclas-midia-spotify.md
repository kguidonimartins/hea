# Solving Spotify: [Multimedia keys do not work with Spotify](https://askubuntu.com/a/1090074)
```shell
# Open Keyboard configs, go to Custom Shortcuts, and add a new shortcut in `+` button
# To play/pause
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
# to previous
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
# to next
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
```
