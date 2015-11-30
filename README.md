dotfiles
========

A collection of the .files I use for configuring my session (Usually terminal stuff)

Installation
------------

Since I'm using [GNU Stow](https://www.gnu.org/software/stow/) now, the instructions are pretty basic.

Any time I have to use a new linux box, all I have to do is install git and stow, and then:

```shell
git clone --recursive https://github.com/StephenBrown2/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./create-links home/work
```

and I have a set up identical to all my other systems.
