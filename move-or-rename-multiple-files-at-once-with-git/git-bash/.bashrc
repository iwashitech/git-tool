# Git Alias
alias gb="git branch"
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcod='git checkout develop'
alias gpl='git pull'
alias gc='git commit --cleanup=whitespace'
alias gs='git status'
alias gss='git status -s'
alias ga='git add .'
alias gai='git add -i'
alias gd='git diff'
alias gwd='git windiff'
alias gsl='git stash list'
alias gsp='git stash pop'

alias gtset=gt_set

function gt_set(){
    branch_name=$(git symbolic-ref --short HEAD)
    git push --set-upstream origin $branch_name
}

# https://snowsystem.net/other/windows/vscode-wsl-run-error/
export PATH=$PATH:'/mnt/c/Program Files/Microsoft VS Code/bin'

alias here='explorer.exe .'
alias bkb='explorer.exe .'
alias example='cd "C:\home\www.example.co.jp"'