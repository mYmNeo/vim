#!/usr/bin/env bash
vim +PluginInstall +qall
bin=$(dirname "${BASH_SOURCE[0]}")
bin=$(cd "$bin"; pwd)

repos=$(find ${bin}/ -maxdepth 3 -name ".git")
for repo in ${repos[@]}; do
  cd $(dirname ${repo})
  echo "sync $repo"
  git pull origin master
  git submodule update --init --recursive
done
${bin}/bundle/YouCompleteMe/install.py --clang-completer --gocode-completer
