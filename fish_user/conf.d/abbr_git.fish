# using
abbr --add ga 'git add'
abbr --add gcam 'git commit --all --message'
abbr --add gl 'git pull'
abbr --add gco 'git checkout'
abbr --add gb 'git branch'
abbr --add gcmsg 'git commit --message'
abbr --add gd 'git diff'
abbr --add gds 'git diff --staged'
abbr --add gp 'git push'
abbr --add gr 'git remote'
abbr --add gra 'git remote add'
abbr --add grb 'git rebase'
abbr --add gdct 'git describe --tags $(git rev-list --tags --max-count=1)'
abbr --add gst 'git status'
abbr --add gsu 'git submodule update'
abbr --add gcm 'git checkout $git_main_branch'

# log
abbr --add glg 'git log --stat'
abbr --add glgg 'git log --graph'
abbr --add glgga 'git log --graph --decorate --all'
abbr --add glgm 'git log --graph --max-count=10'
abbr --add glgp 'git log --stat --patch'
abbr --add glo 'git log --oneline --decorate'
abbr --add glod 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
abbr --add glods 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
abbr --add glog 'git log --oneline --decorate --graph'
abbr --add gloga 'git log --oneline --decorate --graph --all'
abbr --add glol 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
abbr --add glola 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
abbr --add glols 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'



# abbr --add gaa 'git add --all'
# abbr --add gam 'git am'
# abbr --add gama 'git am --abort'
# abbr --add gamc 'git am --continue'
# abbr --add gams 'git am --skip'
# abbr --add gamscp 'git am --show-current-patch'
# abbr --add gap 'git apply'
# abbr --add gapa 'git add --patch'
# abbr --add gapt 'git apply --3way'
# abbr --add gau 'git add --update'
# abbr --add gav 'git add --verbose'
# abbr --add gbD 'git branch --delete --force'
# abbr --add gba 'git branch --all'
# abbr --add gbd 'git branch --delete'
# abbr --add gbg 'LANG=C git branch -vv | grep ": gone\]"'
# abbr --add gbgD 'LANG=C git branch --no-color -vv | grep ": gone\]" | awk '\''{print $1}'\'' | xargs git branch -D'
# abbr --add gbgd 'LANG=C git branch --no-color -vv | grep ": gone\]" | awk '\''{print $1}'\'' | xargs git branch -d'
# abbr --add gbl 'git blame -w'
# abbr --add gbm 'git branch --move'
# abbr --add gbnm 'git branch --no-merged'
# abbr --add gbr 'git branch --remote'
# abbr --add gbs 'git bisect'
# abbr --add gbsb 'git bisect bad'
# abbr --add gbsg 'git bisect good'
# abbr --add gbsn 'git bisect new'
# abbr --add gbso 'git bisect old'
# abbr --add gbsr 'git bisect reset'
# abbr --add gbss 'git bisect start'
# abbr --add gc 'git commit --verbose'
# # abbr --add 'gc '='git commit --verbose --amend'
# abbr --add gcB 'git checkout -B'
# abbr --add gca 'git commit --verbose --all'
# # abbr --add 'gca '='git commit --verbose --all --amend'
# # abbr --add 'gcan '='git commit --verbose --all --no-edit --amend'
# # abbr --add 'gcann '='git commit --verbose --all --date=now --no-edit --amend'
# # abbr --add 'gcans '='git commit --verbose --all --signoff --no-edit --amend'
# abbr --add gcas 'git commit --all --signoff'
# abbr --add gcasm 'git commit --all --signoff --message'
# abbr --add gcb 'git checkout -b'
# abbr --add gcd 'git checkout $(git_develop_branch)'
# abbr --add gcf 'git config --list'
# abbr --add gcl 'git clone --recurse-submodules'
# abbr --add gclean 'git clean --interactive -d'
# # abbr --add 'gcn '='git commit --verbose --no-edit --amend'
# abbr --add gcor 'git checkout --recurse-submodules'
# abbr --add gcount 'git shortlog --summary --numbered'
# abbr --add gcp 'git cherry-pick'
# abbr --add gcpa 'git cherry-pick --abort'
# abbr --add gcpc 'git cherry-pick --continue'
# abbr --add gcs 'git commit --gpg-sign'
# abbr --add gcsm 'git commit --signoff --message'
# abbr --add gcss 'git commit --gpg-sign --signoff'
# abbr --add gcssm 'git commit --gpg-sign --signoff --message'
# abbr --add gdca 'git diff --cached'
# abbr --add gdcw 'git diff --cached --word-diff'
# abbr --add gdt 'git diff-tree --no-commit-id --name-only -r'
# abbr --add gdup 'git diff @{upstream}'
# abbr --add gdw 'git diff --word-diff'
# abbr --add gf 'git fetch'
# abbr --add gfa 'git fetch --all --prune --jobs=10'
# abbr --add gfg 'git ls-files | grep'
# abbr --add gfo 'git fetch origin'
# abbr --add gg 'git gui citool'
# abbr --add gga 'git gui citool --amend'
# abbr --add ggpull 'git pull origin "$(git_current_branch)"'
# abbr --add ggpush 'git push origin "$(git_current_branch)"'
# abbr --add ggsup 'git branch --set-upstream-to=origin/$(git_current_branch)'
# abbr --add ghh 'git help'
# abbr --add gignore 'git update-index --assume-unchanged'
# abbr --add gignored 'git ls-files -v | grep "^[[:lower:]]"'
# abbr --add git-svn-dcommit-push 'git svn dcommit && git push github $(git_main_branch):svntrunk'
# abbr --add gk '\gitk --all --branches &!'
# abbr --add gke '\gitk --all $(git log --walk-reflogs --pretty=%h) &!'
# abbr --add glp _git_log_prettily
# abbr --add gluc 'git pull upstream $(git_current_branch)'
# abbr --add glum 'git pull upstream $(git_main_branch)'
# abbr --add gm 'git merge'
# abbr --add gma 'git merge --abort'
# abbr --add gmc 'git merge --continue'
# abbr --add gmom 'git merge origin/$(git_main_branch)'
# abbr --add gms 'git merge --squash'
# abbr --add gmtl 'git mergetool --no-prompt'
# abbr --add gmtlvim 'git mergetool --no-prompt --tool=vimdiff'
# abbr --add gmum 'git merge upstream/$(git_main_branch)'
# abbr --add gpd 'git push --dry-run'
# abbr --add gpf 'git push --force-with-lease --force-if-includes'
# # abbr --add 'gpf '='git push --force'
# abbr --add gpoat 'git push origin --all && git push origin --tags'
# abbr --add gpod 'git push origin --delete'
# abbr --add gpr 'git pull --rebase'
# abbr --add gpra 'git pull --rebase --autostash'
# abbr --add gprav 'git pull --rebase --autostash -v'
# abbr --add gpristine 'git reset --hard && git clean --force -dfx'
# abbr --add gprom 'git pull --rebase origin $(git_main_branch)'
# abbr --add gpromi 'git pull --rebase=interactive origin $(git_main_branch)'
# abbr --add gprv 'git pull --rebase -v'
# abbr --add gpsup 'git push --set-upstream origin $(git_current_branch)'
# abbr --add gpsupf 'git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes'
# abbr --add gpu 'git push upstream'
# abbr --add gpv 'git push --verbose'
# abbr --add grba 'git rebase --abort'
# abbr --add grbc 'git rebase --continue'
# abbr --add grbd 'git rebase $(git_develop_branch)'
# abbr --add grbi 'git rebase --interactive'
# abbr --add grbm 'git rebase $(git_main_branch)'
# abbr --add grbo 'git rebase --onto'
# abbr --add grbom 'git rebase origin/$(git_main_branch)'
# abbr --add grbs 'git rebase --skip'
# abbr --add grev 'git revert'
# abbr --add greva 'git revert --abort'
# abbr --add grevc 'git revert --continue'
# abbr --add grf 'git reflog'
# abbr --add grh 'git reset'
# abbr --add grhh 'git reset --hard'
# abbr --add grhk 'git reset --keep'
# abbr --add grhs 'git reset --soft'
# abbr --add grm 'git rm'
# abbr --add grmc 'git rm --cached'
# abbr --add grmv 'git remote rename'
# abbr --add groh 'git reset origin/$(git_current_branch) --hard'
# abbr --add grrm 'git remote remove'
# abbr --add grs 'git restore'
# abbr --add grset 'git remote set-url'
# abbr --add grss 'git restore --source'
# abbr --add grst 'git restore --staged'
# abbr --add grt 'cd "$(git rev-parse --show-toplevel || echo .)"'
# abbr --add gru 'git reset --'
# abbr --add grup 'git remote update'
# abbr --add grv 'git remote --verbose'
# abbr --add gsb 'git status --short --branch'
# abbr --add gsd 'git svn dcommit'
# abbr --add gsh 'git show'
# abbr --add gsi 'git submodule init'
# abbr --add gsps 'git show --pretty=short --show-signature'
# abbr --add gsr 'git svn rebase'
# abbr --add gss 'git status --short'
# abbr --add gsta 'git stash push'
# abbr --add gstaa 'git stash apply'
# abbr --add gstall 'git stash --all'
# abbr --add gstc 'git stash clear'
# abbr --add gstd 'git stash drop'
# abbr --add gstl 'git stash list'
# abbr --add gstp 'git stash pop'
# abbr --add gsts 'git stash show --patch'
# abbr --add gsw 'git switch'
# abbr --add gswc 'git switch --create'
# abbr --add gswd 'git switch $(git_develop_branch)'
# abbr --add gswm 'git switch $(git_main_branch)'
# abbr --add gta 'git tag --annotate'
# abbr --add gtl 'gtl(){ git tag --sort=-v:refname -n --list "${1}*" }; noglob gtl'
# abbr --add gts 'git tag --sign'
# abbr --add gtv 'git tag | sort -V'
# abbr --add gunignore 'git update-index --no-assume-unchanged'
# abbr --add gunwip 'git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'
# abbr --add gwch 'git whatchanged -p --abbrev-commit --pretty=medium'
# abbr --add gwip 'git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
# abbr --add gwipe 'git reset --hard && git clean --force -df'
# abbr --add gwt 'git worktree'
# abbr --add gwta 'git worktree add'
# abbr --add gwtls 'git worktree list'
# abbr --add gwtmv 'git worktree move'
# abbr --add gwtrm 'git worktree remove'
