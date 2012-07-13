dotfiles
========

A collection of the .files I use for configuring my session (Usually terminal stuff)

Installation
------------

Since I'm using Tim Heap's create-links script, the instructions are basically the same as [his post on coderwall](http://coderwall.com/p/qz3i5w)

Any time I have to use a new linux box, all I have to do is:

cd
wget -qO- https://github.com/StephenBrown2/dotfiles/tarball/master | tar -xz
mv StephenBrown2-dotfiles-\* .dotfiles
.dotfiles/create-links

and I have a set up identical to all my other systems. Of course, if the system has git this is even easier:

git clone git clone https://github.com/StephenBrown2/dotfiles.git ~/.dotfiles
~/dot-files/create-links
