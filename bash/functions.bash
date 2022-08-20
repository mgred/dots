# function npm_run () {
#   PACKAGE=./package.json
# 	test -f "$PACKAGE" &&
#     cmd=$(jq '.scripts' $PACKAGE |\
#           awk -F\" '/^ / {print $2}' |\
#           fzf --reverse -m |\
#           awk 'BEGIN {cmd=""} { cmd=cmd""(NR >= 2 ? " && " : "")"npm run "$0; } END { print cmd; }') &&
#     tmux split-window "$cmd"
# }
# bind -x '"\C-n":npm_run'

function local_git_branch() {
  branch=$(git branch | grep -v "*" | awk '{print $1}' | fzf --reverse) &&
  git checkout $branch
}
bind -x '"\C-g":local_git_branch'

function open_file_x () {
  file=$(find . -type f | fzf --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 bat --color=always --theme=Nord {} 2> /dev/null | head -500') && $EDITOR $file
}
bind -x '"\C-o":open_file_x'

function gf() {
  commit=$(git log --oneline --decorate --color=always | \
    fzf --color=dark --ansi --reverse --height 20 | \
    awk '{print $1}')

  if [ "$commit" == "" ]; then
    echo "No Commit was selected"
    return
  fi

  git commit $@ --fixup $commit
}

fman() {
  man -k . | fzf --prompt="Man> " | awk '{print $1}' | xargs -r man
}

# vim:tw=80:ts=2:sw=2:expandtab
