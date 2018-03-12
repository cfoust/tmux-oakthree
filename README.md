# 🌳 tmux-oakthree🌳

> a tmux abstraction for the working developer

[![Build Status](https://travis-ci.org/cfoust/tmux-oakthree.svg?branch=master)](https://travis-ci.org/cfoust/tmux-oakthree)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## features

* **fuzzy-find everything**: vim's [ctrlp](https://github.com/kien/ctrlp.vim)
  plugin makes vim awesome. `oakthree` brings similar functionality to tmux so
  that you never have to manage panes again.
* **portable**: All of `oakthree` is written in bash to keep dependencies
  minimal and functionality consistent.
* **fast**: Since `oakthree` uses fzf, your development speed is no longer
  bottlenecked by how quickly you can switch tmux windows. It saves you the
  mental bandwidth of having to remember where all of your panes are.
* **comfort**: `oakthree` comes with a key binding (`prefix` <kbd>G</kbd>) that
  centers whatever you're looking at in the center of your screen. No more
  looking slightly to the left all day.

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
which you'd like to start working, make a new `oakthree` project with the
keybinding below. This opens a window with your `$EDITOR` and an accompanying
`$SHELL` that you can switch between easily.

## bindings

**Everywhere:**
* <kbd>tmux prefix</kbd>+<kbd>K</kbd>: Open a fuzzy-finder for your open
  projects.
* <kbd>tmux prefix</kbd>+<kbd>L</kbd>: Open a fuzzy-finder for your open
  shells.
* <kbd>tmux prefix</kbd>+<kbd>J</kbd>: Open a new shell in this window's
  directory.
* <kbd>tmux prefix</kbd>+<kbd>Ctrl</kbd>+<kbd>L</kbd>: Switch between the
  most recent shell and the most recent project.
* <kbd>tmux prefix</kbd>+<kbd>G</kbd>: Center or uncenter the current window.

**Just in projects:**
* [no prefix] <kbd>Ctrl</kbd>+<kbd>L</kbd>: Switch between a project's editor
  and its shell.

## installation

Install [tpm](https://github.com/tmux-plugins/tpm) and
[fzf](https://github.com/junegunn/fzf). Add the following to your `.tmux.conf`:
```
set -g @plugin 'cfoust/tmux-oakthree'
```

Restart tmux and `tpm` will install oakthree automagically.

**NOTE:** `oakthree` is a replacement for tmux's default bindings and
environment. It switches to a new binding table and as a result none of your
other bindings will be preserved. This is by design; the goal of the project is
to offer an approachable and fast abstraction over the power of tmux. If you
rely heavily on making your own windows and panes programmatically, `oakthree`
is probably not for you.
