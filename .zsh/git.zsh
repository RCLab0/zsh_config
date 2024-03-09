# 保管
COMPLATION_DIR=$HOME/.zsh/git-completions
if [ ! -d $COMPLATION_DIR ]; then
    mkdir $COMPLATION_DIR
    # CAUTION 外部サイトを使っているので、動かなくなる可能性あり
    curl -o $COMPLATION_DIR/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
    curl -o $COMPLATION_DIR/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
fi
fpath=($COMPLATION_DIR $fpath)

# git alias
alias ga="git add "
alias gc="git commit -m "
alias gca="git commit --amend -m "

alias gp="git push "
alias gpl="git fetch -p && git merge "
alias gsw="git switch "
alias gswc="git switch -c "

alias gb="git branch "
alias gbd="git branch -d "
alias gbD="git branch -D "
alias gbdm="gb --merged | grep -E 'feature|hotfix' | xargs gbd "
alias gbrdm="(cat <(git branch -r --merged main) <(git branch -r --merged master)) | grep -E 'origin/feature|origin/hotfix' | awk '{ sub(\"origin/\", \"\") } { print }' | xargs git push origin --delete "

alias gs="git status "
alias gcp="git cherry-pick "
alias gm="git merge "

alias gd="git diff "
alias gl="git log -p " # <commit_id..commit_id> / <branch_name>
alias gld="git log -p --no-merge "

# git alias を grep を用いて一覧表示する
# alias コマンドを使うとコメントが消えるので、コメントも見られるように
alias git_alias="cat $HOME/.zsh/git.zsh | grep alias | grep git | grep -v grep"


# git current branch 表示
function git-current-branch {
    local branch_name
    # git rev-parse --abbrev-ref @ でブランチ名取得
    # 存在しない場合、つまり標準エラー出力は /dev/null に捨てる
    branch_name=`git rev-parse --abbrev-ref @ 2>/dev/null`
    if [ -n "$branch_name" ]; then
        # %K{color_code} から $k までの間は背景色を color_code に変えられる
        # %B から %b の間は太文字
        echo "%K{244} %~ %B%K{29} $branch_name %k%b"
        exit -1
    fi
    echo "%K{244} %~ %k"
}

setopt prompt_subst
PROMPT='`git-current-branch`$ '