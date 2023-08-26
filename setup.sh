#!/usr/bin/env bash

mkdir -p ~/.emacs.d
mkdir -p ~/.emacs.d/autosaves

ln -sn $(pwd)/init.el ~/.emacs.d/init.el
ln -sn $(pwd)/early-init.el ~/.emacs.d/early-init.el
ln -sn $(pwd)/custom.el ~/.emacs.d/custom.el
ln -sn $(pwd)/lisp ~/.emacs.d/lisp