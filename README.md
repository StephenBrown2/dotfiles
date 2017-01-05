dotfiles
========

A collection of the .files I use for configuring my session (Usually terminal stuff)

Installation
------------

Since I'm using [rcm](https://github.com/thoughtbot/rcm) now, the instructions are pretty basic.

Any time I have to use a new linux box, all I have to do is:

```shell
$ pacman -S git rcm  # Or whichever method is needed to install them
$ git clone https://github.com/StephenBrown2/dotfiles.git ~/.dotfiles
$ rcup
```

and I have a set up identical to all my other systems, with host-specifc config set from the `host-` prefixed dirs.
