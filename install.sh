#!/bin/sh

if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi

if ! grep "(load \"~/bin/tekadv-mode.el\")" ~/.emacs > tmp; then
    echo "(load \"~/bin/tekadv-mode.el\")" >> ~/.emacs
fi
if ! grep "(add-to-list 'auto-mode-alist '(\"\\\\\\\\.ta\\\\\\\\'\" . tekadv-mode))" ~/.emacs > tmp; then
    echo "(add-to-list 'auto-mode-alist '(\"\\\\.ta\\\\'\" . tekadv-mode))" >> ~/.emacs
fi
rm tmp
cp tekadv-mode.el ~/bin/
echo "Done !"
