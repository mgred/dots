#
# Common
#
alias d="pwd"
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias h="history 25"
alias j="jobs -l"
alias ls="ls --color=auto"
alias l="ls -h"
alias la="ls -FA"
alias ll="ls -lAF"
alias o="$EDITOR $@"
alias n="nnn -C -e"
alias vic="o ~/.config/nvim/init.vim"
alias cu="cd ../"
alias ca="cd -"
alias sb="source $HOME/.bashrc"

#
# Git
#
alias g="git remote -v | awk '{ print \$1 \" \" \$2 }' | uniq && git status -sb"
# alias ga="git add"
alias gaa="git add --all"
alias gba="git branch -a | grep -v -e '*' -e 'HEAD' | awk '{ print \$1 }'"
alias gc="git commit"
alias gca="git commit --all"
alias gcam="git commit -am"
alias gcfl='git commit --fixup $(git log --format="%H" -n 1)'
alias gcd="git clean -df"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcf="git checkout --force"
alias gcr="git checkout --track"
alias gcom="git log --format=\"%C(auto)%h %s\" --color=always | fzf --ansi --no-sort | awk '{print \$1}'"
# alias gd="git diff"
alias gff="git fetch --all --prune"
alias gl="git pull"
alias glo="git log --oneline --graph --decorate"
alias gll="git log --pretty=full"
alias gp="git push"
alias gpp="git push --force"
alias gpu="git push -u origin HEAD"
alias gpup="git push --set-upstream"
alias grm="git rebase origin/master"
alias grc="git rebase --continue"
alias grias='git rebase --autosquash --interactive ${1}'
alias grorig='git reset --hard ORIG_HEAD'
# alias grias='git rebase -i --autosquash $(git log --format="%H %D" | awk "\$2 ~ /origin\/master.*/ { print \$1 }")'
alias grr="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -D"
alias grh="git reset HEAD~1"

alias t='touch $1'
