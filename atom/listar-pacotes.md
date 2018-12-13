# There are a couple different ways to do this:

Use the Stars functionality to keep a list of the packages you use
Use a script to list the directories in the `~/.atom/packages` folder and save that to a file

1. Stars

You can use the https://atom.io/packages site to find the packages you like and Star them. Or you can star the packages you like from the command line by issuing the command `apm star package-name`. Then you can install all of your starred packages at any time by executing the command `apm stars --install` at the command line.

You can also use the `apm star --installed` command to easily star all the packages you currently have installed.

(This is the method I use.)

2. Package List

You use the following:

`apm list --installed --bare > package-list.txt` to create your package list and then `apm install --packages-file package-list.txt` to install them.

From: https://discuss.atom.io/t/installed-packages-list-into-single-file/12227
