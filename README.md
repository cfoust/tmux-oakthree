# tmux-oakthree🌳

> a tmux abstraction for the working developer

[![Build Status](https://travis-ci.org/cfoust/tmux-oakthree.svg?branch=master)](https://travis-ci.org/cfoust/tmux-oakthree)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## features

* **fuzzy-find everything**: vim's [ctrlp](https://github.com/kien/ctrlp.vim)
  plugin is wonderful. `oakthree` brings similar functionality to tmux so that
  you never have to manage panes again.
* **portable**: All of `oakthree` is written in bash to keep dependencies
  minimal and functionality consistent.
* **fast**: Since `oakthree` uses fzf, your development speed is no longer
  bottlenecked by how quickly you can switch tmux windows.
* **comfort**: `oakthree` comes with a key binding (`<tmux-prefix> g`) that
  centers whatever you're looking at in the center of your screen. No more
  looking slightly to the left.

## purpose

`tmux` is wonderful. However, I found that I fell into the same pattern of
usage: I would jump to a directory, open vim, and open a shell. Sometimes I
would add another shell for long-running daemons, but ultimately I stuck to the
same few windows. What `oakthree` does is makes this pattern more intentional.
It hides all of the cruft like panes, windows, and status bars that come along
with tmux and gives you a rigid, fast, and consistent set of functionality out
of the box.

## usage

`oakthree` starts with just a single shell window. When you find a directory in
which you'd like to start working, type `<tmux-prefix> o`. This opens a new
`oakthree` "project," which is really just a window with your editor and an
accompanying shell, which you can switch between by typing `Ctrl+L` unprefixed
by your tmux bindings.

Type `<tmux-prefix> k` to open up a fuzzy finder of projects and `<tmux-prefix>
l` to search through shells.

## installation

Install [tpm](https://github.com/tmux-plugins/tpm) and
[fzf](https://github.com/junegunn/fzf). Add the following to your `.tmux.conf`:
```
set -g @plugin 'cfoust/tmux-oakthree'
```

Restart tmux and `tpm` will install oakthree automagically.
