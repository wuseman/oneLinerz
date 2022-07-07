# git

### Set token
```sh
CURL='curl -sL -H "Authorization: token $GIT_TOKEN" '
GIT_TOKEN="<token>"
BAK_DIR=$(date +"%Y-%m-%d"); 
```

### Clone all repos from a user
```sh
    for i in `curl -H "Authorization: token ${GIT_TOKEN}" https://api.github.com/user/repos?per_page=100 \
    |grep ssh_url\
    | cut -d ':' -f 2-3 \
    |tr -d '",'`; do echo $i; 
    done > repos; 
    while read line; do git clone $line; done < repos
```

### Print all gistss from a user
```sh
curl -sL https://api.github.com/gists
```

## Clone all gists
```sh
mkdir $BAK_DIR-gists;
cd $BAK_DIR-gists
$CURL|grep -oi "https.*raw.*"|cut -d'"' -f1|xargs -P5 wget
```

### Random git commit
```sh
git commit -m "$(w3m whatthecommit.com | head -n 1)"
```
### Print the list of your Git commits this month
```sh
git log --since='last month' --author="$(git config user.name)" --oneline
```
### Scan entire Git repo for dangerous Amazon Web Service IDs
```sh
git grep -Ew '[A-Z0-9]{20}'
```
### Scan entire Git repos for dangerous Amazon Web Service IDs 
```sh
git ls-tree --full-tree -r --name-only HEAD | xargs egrep -w '[A-Z0-9]{20}'
```
### List status of all GIT repos
```sh
find ~ -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | awk '{print "-------------------------\n\033[1;32mGit Repo:\033[0m " $1; system("git --git-dir="$1".git --work-tree="$1" status")}'
```

### Show git branches by date - useful for showing active branches
```sh
git for-each-ref sort=-committerdate format="%1B[32m%(committerdate:iso8601) %1B[34m%(committerdate:relative)  %1B[0;m%(refname:short)" refs/heads/
```

### add untracked/changed items to a git repository before doing a commit and/or sending upstream
```sh
git status porcelain | awk '{print $2}' | xargs git add
```

### Get first Git commit hash
```sh
git log format=%H | tail -1
```

### Force Git to overwrite local files after fetch
```sh
git reset hard origin/master
```

### restoring a directory from history
```sh
git checkout HEAD~2  /path/to/dir
```

### Push to all remote repos with git
```sh
git remote | xargs -n 1 git push
```

### revert the unstaged modifications in a git working directory
```sh
git diff | git apply reverse
```

### Create a git commit with no message
```sh
git commit allow-empty-message message ""
```

### My git log alias
```sh
git log graph decorate pretty=oneline abbrev-commit
```

### Pushing changes to an empty git repository for the first time
```sh
git push set-upstream origin master
```

### Clone all remote branches of a specific GitHub repository
```sh
git branch -a | grep "remotes/origin" | grep -v master | awk -F / '{print $3}' | xargs -I % git clone -b % git://github.com/jamesotron/DevWorld-2010-Cocoa-Workshop %
```

### Prints per-line contribution per author for a GIT repository
```sh
git ls-files | while read i; do git blame $i | sed -e 's/^[^(]*(//' -e 's/^\([^[:digit:]]*\)[[:space:]]\+[[:digit:]].*/\1/'; done | sort | uniq -ic | sort -nr
```

### Search git repo for specified string
```sh
git grep "search for something" $(git log -g pretty=format:%h -S"search for something")
```

### FInd out what branches a specific commit belongs to
```sh
git branch contains <commit sha1 id> | sed -e 's/^[ *]*//'
```

### create html output from colored, word-level git diff
```sh
git diff word-diff color-words  | aha > index.html && firefox index.html
```

### Deletes all branches in a git repository except next and master (clean git repo)
```sh
git branch -D `git branch | awk  '{ if ($0 !~ /next|master/) printf "%s", $0 }'`
```

### Deleting a remote git branch (say, by name 'featureless')
```sh
git push origin :featureless
```

### Push each of your local git branches to the remote repository
```sh
git push origin all
```

### bash script to zip a folder while ignoring git files and copying it to dropbox
```sh
git archive HEAD | gzip > ~/Dropbox/archive.tar.gz
```

### random git-commit message
```sh
git-random(){ gitRan=$(curl -L -s http://whatthecommit.com/ |grep -A 1 "\"c" |tail -1 |sed  's/<p>//'); git commit -m "$gitRan"; }
```

### Sequential revision numbers in Git
```sh
git rev-list reverse HEAD | awk "/$(git log -n 1 pretty="format:%h")/ {print NR}"
```

### Cherry-pick range of commits, starting from the tip of 'master', into 'preview' branch
```sh
git rev-list reverse topo-order master... | while read rev; do git checkout preview; git cherry-pick $rev || break; done
```

### Push all local branches to remote repo
```sh
git push origin all
```

### git log -n 1 -p FILENAME| head -n 1 | awk -F " " '{print $2}'
```sh
git last commit on a file.
```

### Create a git repository
```sh
git-createrepo() { repos_path='/srv/git/'; mkdir $repos_path$1; cd $repos_path$1;   git init bare;   echo "Repository location: ssh://$USER@`cat /etc/HOSTNAME``pwd`"; cd -; }
```

### Stage added, updated, and DELETED files for commit
```sh
git add -u
```

### git remove files which have been deleted
```sh
git ls-files -z deleted | xargs -0 git rm
```

### Using Git, stage all manually deleted files.
```sh
git add -u
```

### show git commit history
```sh
git reflog show | grep '}: commit' | nl | sort -nr | nl | sort -nr | cut fields=1,3 | sed s/commit://g | sed -e 's/HEAD*@{[0-9]*}://g'
```

### (Git) Revert files with changed mode, not content
```sh
git diff numstat | awk '{if ($1 == "0" && $2 == "0") print $3}'  | xargs git checkout HEAD
```

### Undo several commits by committing an inverse patch.
```sh
git diff HEAD..rev | git apply index; git commit
```

### Display summary of git commit ids and messages for a given branch
```sh
git log master | awk '/commit/ {id=$2} /\s+\w+/ {print id, $0}'
```

### create new branch from stashed changes
```sh
git stash branch testchanges
```

### Prints per-line contribution per author for a GIT repository
```sh
git ls-files | xargs -n1 -d'\n' -i git-blame {} | perl -n -e '/\s\((.*?)\s[0-9]{4}/ && print "$1\n"' | sort -f | uniq -c -w3 | sort -r
```

### Stage only portions of the changes to a file.
```sh
git add patch <filename>
```

### List all authors of a particular git project
```sh
git shortlog -s | cut -c8-
```

### update you web
```sh
git archive format=tar HEAD | (cd /var/www/ && tar xf -)
```

### bash script to zip a folder while ignoring git files and copying it to dropbox
```sh
git archive HEAD format=zip > archive.zip
```

### List all authors of a particular git project
```sh
git log format='%aN <%aE>' | awk '{arr[$0]++} END{for (i in arr){print arr[i], i;}}' | sort -rn | cut -d\  -f2-
```

### grep across a git repo and open matching files in gedit
```sh
git grep -l "your grep string" | xargs gedit
```

### git remove files which have been deleted
```sh
git rm $(git ls-files deleted)
```

### Git Tree Command with color and tag/branch name
```sh
git log graph oneline all decorate color
```

### Figure out your work output for the day
```sh
git diff stat `git log author="XXXXX" since="12 hours ago" pretty=oneline | tail -n1 | cut -c1-40` HEAD
```

### Better git diff, word delimited and colorized
```sh
git config alias.dcolor "diff color-words"
```

### Delete all local git branches that have been merged
```sh
git branch merged | grep -v "\*" | xargs -n 1 git branch -d
```

### Switch to the previous branch used in git(1)
```sh
git checkout -
```

### List all authors of a particular git project
```sh
git log format='%aN' | sort -u
```

### github push-ing behind draconian proxies!
```sh
git remote add origin git@SSH-HOST:<USER>/<REPOSITORY>.git
```

### Import/clone a Subversion repo to a git repo
```sh
git svn authors-file=some-authors-file clone svn://address/of/svn/repo new-git-dir
```

### Show log message including which files changed for a given commit in git.
```sh
git no-pager whatchanged -1 pretty=medium <commit_hash>
```

### Using Git, stage all manually deleted files.
```sh
git rm $(git ls-files deleted)
```

### My Git Tree Command!
```sh
git log graph oneline all
```

### Get first Git commit hash
```sh
git rev-list max-parents=0 HEAD
```

### random git-commit message
```sh
git commit -m "$(curl -s http://whatthecommit.com/index.txt)";
```

### Better git diff, word delimited and colorized
```sh
git diff -U10 |wdiff diff-input -a -n -w $'\e[1;91m' -x $'\e[0m' -y $'\e[1;94m' -z $'\e[0m' |less -R
```

### Generate a Change Log with git
```sh
git log no-merges format="%an: %s" v1..v2
```

### GIT: list unpushed commits
```sh
git log oneline <REMOTE>..<LOCAL BRANCH>
```

### delete multiple files from git index that have already been deleted from disk
```sh
git status | grep deleted | awk '{print $3}' | xargs git rm
```

### Display condensed log of changes to current git repository
```sh
git log pretty=oneline
```

### Restore deleted file from GIT repository
```sh
git checkout $(git rev-list -n 1 HEAD  "$file")^  "$file"
```

### Show (only) list of files changed by commit
```sh
git show relative pretty=format:'' name-only HASH
```

### Delete all git branches except master
```sh
git branch | grep -v "master" | sed 's/^[ *]*//' | sed 's/^/git branch -D /' | bash
```

### git diff of files that have been staged ie 'git add'ed
```sh
git diff cached
```

### Display condensed log  in a tree-like format.
```sh
git log graph pretty=oneline decorate
```

### List every file that has ever existed in a git repository
```sh
git log all pretty=format:" " name-only | sort -u
```

### List all files ever added in git repository
```sh
git log name-status oneline all | grep -P "^[A|M|D]\s" | awk '{print $2}' | sort | uniq
```

### Git diff last two commits
```sh
git diff $(git log pretty=format:%h -2 reverse | tr "\n" " ")
```

### Show changed files, ignoring permission, date and whitespace changes
```sh
git diff numstat -w no-abbrev | perl -a -ne '$F[0] != 0 && $F[1] !=0 && print $F[2] . "\n";'
```

### 100% rollback files to a specific revision
```sh
git reset hard <commidId> && git clean -f
```

### Git Global search and replace
```sh
git grep -l foo | xargs sed -i 's/foo/bar/g'
```

### Show git branches by date - useful for showing active branches
```sh
git for-each-ref sort='-authordate' format='%(refname)%09%(authordate)' refs/heads | sed -e 's-refs/heads/'
```

### Display summary of git commit ids and messages for a given branch
```sh
git log pretty='format:%Cgreen%H %Cred%ai %Creset- %s'
```

### show git logging
```sh
git log stat
```

### A nice way to show git commit history, with easy to read revision numbers instead of the default hash
```sh
git log reverse pretty=oneline | cut -c41- | nl | sort -nr
```

### git remove files which have been deleted
```sh
git add -u
```

### git remove files which have been deleted
```sh
git add -u
```

### Prints per-line contribution per author for a GIT repository
```sh
git ls-files | xargs -n1 git blame line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr
```

### Search git logs (case-insensitive)
```sh
git log -i grep='needle'
```

### Set GIT_COMMITTER_DATE = GIT_AUTHOR_DATE for all the git commits
```sh
git filter-branch env-filter 'export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"'
```

### Open the current project on Github by typing gh
```sh
git remote -v | grep fetch | sed 's/\(.*github.com\)[:|/]\(.*\).git (fetch)/\2/' | awk {'print "https://github.com/" $1'} | xargs open
```

### Add forgotten changes to the last git commit
```sh
git commit amend
```

### diff color words
```sh
git diff color-words file1 file2
```

### Remove git branches that do not have a remote tracking branch anymore
```sh
git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
```

### Create a git alias that will pull and fast-forward the current branch if there are no conflicts
```sh
git config global add alias.ff "pull no-commit -v" ; git ff
```

### generate file list modified since last commit and export to tar file
```sh
git diff-tree -r no-commit-id name-only diff-filter=ACMRT COMMID_HASH | xargs tar -rf mytarfile.tar
```

### Export unpushed files list
```sh
git log origin/master..master name-only pretty="format:" | sort | uniq | xargs tar -rf mytarfile.tar
```

### [git] Output remote origin from within a local repository
```sh
git config local get remote.origin.url
```

### Lint Git unstaged PHP files
```sh
git status -s | grep -o ' \S*php$' | while read f; do php -l $f; done
```

### Get first Git commit hash
```sh
git log pretty=format:%H | tail -1
```

### Find the date of the first commit in a git repository
```sh
git rev-list all|tail -n1|xargs git show|grep -v diff|head -n1|cut -f1-3 -d' '
```

### See all the commits for which searchstring appear in the git diff
```sh
git log -p -z | perl -ln0e 'print if /[+-].*searchedstring/'
```

### Count git commits since specific commit
```sh
git log pretty=oneline b56b83.. | wc -l
```

### Git fetch all remote branches
```sh
git branch -r | awk -F'/' '{print "git fetch "$1,$2}' | xargs -I {} sh -c {}
```

### Show a git log with offsets relative to HEAD
```sh
git log oneline | nl -v0 | sed 's/^ \+/&HEAD~/'
```

### Delete specific remote 'origin' branch 'gh-pages'
```sh
git push origin :gh-pages
```

### get current git branch
```sh
git rev-parse symbolic-full-name abbrev-ref HEAD
```

### Top Ten of the most active committers in git repositories
```sh
git shortlog -s | sort -rn | head
```

### Serve one or more git repositories
```sh
git daemon reuseaddr verbose export-all base-path=/parent/of/bare/git/repos
```

### git diff external without additional script
```sh
git config global diff.external 'bash -c "meld $2 $5"'
```

### git-rm for all deleted files, including those with space/quote/unprintable characters in their filename/path
```sh
git ls-files -z -d | xargs -0 git rm 
```

### Delete first 10 branches from remote origin (exclude master)
```sh
git branch -a | grep "remotes/origin" | grep -v master | sed 's/^[ *]*//' | sed 's/remotes\/origin\///' | head -n10 | sed 's/^/git push origin :/' | bash
```

### delete local *and* remote git repos if merged into local master
```sh
git branch | cut -c3- | grep -v "^master$" | while read line; do git branch -d $line; done | grep 'Deleted branch' | awk '{print $3;}' | while read line; do git push <target_remote> :$line; done
```

### git commit message and body
```sh
git commit -m "commit title message" -m "commit body message";
```

### Create a git archive of the latest commit with revision number as name of file
```sh
git archive HEAD format=zip -o `git rev-parse HEAD`.zip
```

### Show hash and message of dangling git commits
```sh
git fsck lost-found | grep commit | cut -d " " -f 3 | xargs git show -s oneline
```

### Display file names that have common ancestors
```sh
git diff $(git merge-base master HEAD) name-only
```

### Number of commits per day in a git repository
```sh
git log | grep Date | awk '{print " : "$4" "$3" "$6}' | uniq -c
```

### Makes a project directory, unless it exists; changes into the dir, and creates an empty git repository, all in one command
```sh
gitstart () { if ! [[ -d "$@" ]]; then mkdir -p "$@" && cd "$@" && git init; else cd "$@" && git init; fi }
```

### Removing sensitive data from the entire repo history.
```sh
git filter-branch index-filter 'git rm cached ignore-unmatch FileToRemove' HEAD
```

### Creating a feature branch
```sh
git checkout -b myfeature develop
```

### Incorporating a finished feature on develop
```sh
git checkout develop; git merge no-ff myfeature
```

### Open (in vim) all modified files in a git repository
```sh
git status porcelain | sed -ne 's/^ M //p' | tr '\n' '\0' | tr -d '"' | xargs -0 vim
```

### Incorporating a finished feature on develop : Deleted branch myfeature
```sh
git branch -d myfeature
```

### Git log (commits titles) of today
```sh
git log after="yesterday" pretty=format:%s |uniq
```

### Find out what files are changed or added in a git repository.
```sh
git log name-only | less
```

### Get all git commits of a specific author in a nice format
```sh
git log name-status author="[The Author's Name]"
```

### Copy modified files between two Git commits
```sh
git diff name-only diff-filter=AMXTCR HEAD~2 HEAD | xargs -l -I{}  cp parents verbose "{}" target_dir
```

### Interactive rebase
```sh
git rebase -i SHA
```

### Remove tag git
```sh
git tag -d tagname
```

### git discard unstaged changes
```sh
git stash save keep-index
```

### git -  create a local branch that tracks with the remote branch
```sh
git checkout -tb mybranch origin/mybranch
```

### Git branches sorted by last commit date
```sh
git for-each-ref sort=-committerdate refs/heads/
```

### Better git diff, word delimited and colorized
```sh
git diff -U10|dwdiff diff-input -c|less -R
```

### git merge dry-run
```sh
git merge no-commit no-ff
```

### git branch point
```sh
git merge-base branch1 branch2
```

### Move all files untracked by git into a directory
```sh
git clean -n | sed 's/Would remove //; /Would not remove/d;' | xargs mv -t stuff/
```

### Remove branches that no longer exist from being shown via 'git branch -a'
```sh
git remote prune origin
```

### Remove all untracked files/directories from the working tree of a git repository.
```sh
git clean -dfx
```

### autocreate git tag
```sh
git tag rel`date +%Y-%m-%d%H-%M-%S` -m "(%) rel: stage"
```

### Show the changed files in your GIT repo
```sh
git status | perl -F'\s' -nale 'BEGIN { $a = 0 }; $a = 1 if $_ =~ /changed but not updated/i; print $F[-1] if ( $a && -f $F[-1] )'
```

### Diff 2 branches, for a type of file & having a string in the diff
```sh
git diff t1_clone tlocal4 name-only | grep -i "swift" | xargs git diff t1_clone tlocal4 word-diff-regex="NSLocalized"
```

### which git tags include this commit?
```sh
git tag -l contains 18f6f2 live*
```

### Git branches I checked-out on a specific date
```sh
git reflog date=local | grep "Oct 2 .* checkout: moving from .* to" | grep -o "[a-zA-Z0-9\-]*$" | sort | uniq
```

### git log1 alias
```sh
git config global alias.log1 "log pretty=oneline abbrev-commit"
```

### Update the working tree to the latest git commit
```sh
git log -g pretty=oneline | grep '}: commit' | awk '{print $1}' | head -1 | xargs git checkout -f
```

### Execute git submodule update in parallel with xargs
```sh
git submodule status | awk '{print $2}' | xargs -P5 -n1 git submodule update init
```

### Find 10 largest files in git history
```sh
git verify-pack -v .git/objects/pack/pack-*.idx | grep blob | sort -k3nr | head | while read s x b x; do git rev-list all objects | grep $s | awk '{print "'"$b"'",$0;}'; done
```

### Archive git branches in "arhive/" tags
```sh
git branch | grep -v "master" | sed 's/^[ *]*//' | sed 's/.*/& &/' | sed 's/^/git tag archive\//' | bash
```

### Batch Remove git tags from remote server
```sh
git ls-remote tags origin | awk '/^(.*)(\s+)(.*)(YOUR-TAG-SPECIFIC-SEARCH-TERM-HERE)(.*)(-+)(.*)[^{}]$/ {print ":" $2}' | xargs git push origin
```

### Find the date of the first commit in a git repository
```sh
git rev-list all|tail -n1|xargs git show|grep -v diff|head -n1|cut -f1-3 -d' '
```

### Count git commits since specific commit
```sh
git log summary 223286b.. | grep 'Author:' | wc -l
```

### add untracked/changed items to a git repository before doing a commit and/or sending upstream
```sh
git status|awk '/modified:/ { printf("git add %s\n",$3) }; NF ==2 { printf("git add %s\n",$2) }'|sh
```

### Grab all JIRA ticket numbers (e.g. ABC-123) mentioned in commits added in feature branch off of master
```sh
git log master...feature-a | grep -o -E '\b([A-Z]+)-[0-9]+\b' | sort | uniq
```

### simple single-lined git log
```sh
git log pretty=oneline abbrev-commit
```

### git remove files which have been deleted
```sh
git ls-files -z deleted | xargs -0 git rm
```

### Using Git, stage all manually deleted files.
```sh
git add -u
```

### show git commit history
```sh
git reflog show | grep '}: commit' | nl | sort -nr | nl | sort -nr | cut fields=1,3 | sed s/commit://g | sed -e 's/HEAD*@{[0-9]*}://g'
```

### (Git) Revert files with changed mode, not content
```sh
git diff numstat | awk '{if ($1 == "0" && $2 == "0") print $3}'  | xargs git checkout HEAD
```

### Undo several commits by committing an inverse patch.
```sh
git diff HEAD..rev | git apply index; git commit
```

### Display summary of git commit ids and messages for a given branch
```sh
git log master | awk '/commit/ {id=$2} /\s+\w+/ {print id, $0}'
```

### create new branch from stashed changes
```sh
git stash branch testchanges
```

### Prints per-line contribution per author for a GIT repository
```sh
git ls-files | xargs -n1 -d'\n' -i git-blame {} | perl -n -e '/\s\((.*?)\s[0-9]{4}/ && print "$1\n"' | sort -f | uniq -c -w3 | sort -r
```

### Stage only portions of the changes to a file.
```sh
git add patch <filename>
```

### List all authors of a particular git project
```sh
git shortlog -s | cut -c8-
```

### update you web
```sh
git archive format=tar HEAD | (cd /var/www/ && tar xf -)
```

### bash script to zip a folder while ignoring git files and copying it to dropbox
```sh
git archive HEAD format=zip > archive.zip
```

### List all authors of a particular git project
```sh
git log format='%aN <%aE>' | awk '{arr[$0]++} END{for (i in arr){print arr[i], i;}}' | sort -rn | cut -d\  -f2-
```

### grep across a git repo and open matching files in gedit
```sh
git grep -l "your grep string" | xargs gedit
```

### git remove files which have been deleted
```sh
git rm $(git ls-files deleted)
```

### Git Tree Command with color and tag/branch name
```sh
git log graph oneline all decorate color
```

### Figure out your work output for the day
```sh
git diff stat `git log author="XXXXX" since="12 hours ago" pretty=oneline | tail -n1 | cut -c1-40` HEAD
```

### Better git diff, word delimited and colorized
```sh
git config alias.dcolor "diff color-words"
```

### Delete all local git branches that have been merged
```sh
git branch merged | grep -v "\*" | xargs -n 1 git branch -d
```

### Switch to the previous branch used in git(1)
```sh
git checkout -
```

### List all authors of a particular git project
```sh
git log format='%aN' | sort -u
```

### github push-ing behind draconian proxies!
```sh
git remote add origin git@SSH-HOST:<USER>/<REPOSITORY>.git
```

### Import/clone a Subversion repo to a git repo
```sh
git svn authors-file=some-authors-file clone svn://address/of/svn/repo new-git-dir
```

### Show log message including which files changed for a given commit in git.
```sh
git no-pager whatchanged -1 pretty=medium <commit_hash>
```

### Using Git, stage all manually deleted files.
```sh
git rm $(git ls-files deleted)
```

### My Git Tree Command!
```sh
git log graph oneline all
```

### Get first Git commit hash
```sh
git rev-list max-parents=0 HEAD
```

### random git-commit message
```sh
git commit -m "$(curl -s http://whatthecommit.com/index.txt)";
```

### Better git diff, word delimited and colorized
```sh
git diff -U10 |wdiff diff-input -a -n -w $'\e[1;91m' -x $'\e[0m' -y $'\e[1;94m' -z $'\e[0m' |less -R
```

### Generate a Change Log with git
```sh
git log no-merges format="%an: %s" v1..v2
```

### GIT: list unpushed commits
```sh
git log oneline <REMOTE>..<LOCAL BRANCH>
```

### delete multiple files from git index that have already been deleted from disk
```sh
git status | grep deleted | awk '{print $3}' | xargs git rm
```

### Display condensed log of changes to current git repository
```sh
git log pretty=oneline
```

### Restore deleted file from GIT repository
```sh
git checkout $(git rev-list -n 1 HEAD  "$file")^  "$file"
```

### Show (only) list of files changed by commit
```sh
git show relative pretty=format:'' name-only HASH
```

### Delete all git branches except master
```sh
git branch | grep -v "master" | sed 's/^[ *]*//' | sed 's/^/git branch -D /' | bash
```

### git diff of files that have been staged ie 'git add'ed
```sh
git diff cached
```

### Display condensed log  in a tree-like format.
```sh
git log graph pretty=oneline decorate
```

### List every file that has ever existed in a git repository
```sh
git log all pretty=format:" " name-only | sort -u
```

### List all files ever added in git repository
```sh
git log name-status oneline all | grep -P "^[A|M|D]\s" | awk '{print $2}' | sort | uniq
```

### Git diff last two commits
```sh
git diff $(git log pretty=format:%h -2 reverse | tr "\n" " ")
```

### Show changed files, ignoring permission, date and whitespace changes
```sh
git diff numstat -w no-abbrev | perl -a -ne '$F[0] != 0 && $F[1] !=0 && print $F[2] . "\n";'
```

### 100% rollback files to a specific revision
```sh
git reset hard <commidId> && git clean -f
```

### Git Global search and replace
```sh
git grep -l foo | xargs sed -i 's/foo/bar/g'
```

### Show git branches by date - useful for showing active branches
```sh
git for-each-ref sort='-authordate' format='%(refname)%09%(authordate)' refs/heads | sed -e 's-refs/heads/'
```

### Display summary of git commit ids and messages for a given branch
```sh
git log pretty='format:%Cgreen%H %Cred%ai %Creset- %s'
```

### show git logging
```sh
git log stat
```

### A nice way to show git commit history, with easy to read revision numbers instead of the default hash
```sh
git log reverse pretty=oneline | cut -c41- | nl | sort -nr
```

### git remove files which have been deleted
```sh
git add -u
```

### Prints per-line contribution per author for a GIT repository
```sh
git ls-files | xargs -n1 git blame line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr
```

### Search git logs (case-insensitive)
```sh
git log -i grep='needle'
```

### Set GIT_COMMITTER_DATE = GIT_AUTHOR_DATE for all the git commits
```sh
git filter-branch env-filter 'export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"'
```

### Open the current project on Github by typing gh
```sh
git remote -v | grep fetch | sed 's/\(.*github.com\)[:|/]\(.*\).git (fetch)/\2/' | awk {'print "https://github.com/" $1'} | xargs open
```

### Add forgotten changes to the last git commit
```sh
git commit amend
```

### diff color words
```sh
git diff color-words file1 file2
```

### Remove git branches that do not have a remote tracking branch anymore
```sh
git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
```

### Create a git alias that will pull and fast-forward the current branch if there are no conflicts
```sh
git config global add alias.ff "pull no-commit -v" ; git ff
```

### generate file list modified since last commit and export to tar file
```sh
git diff-tree -r no-commit-id name-only diff-filter=ACMRT COMMID_HASH | xargs tar -rf mytarfile.tar
```

### Export unpushed files list
```sh
git log origin/master..master name-only pretty="format:" | sort | uniq | xargs tar -rf mytarfile.tar
```

### [git] Output remote origin from within a local repository
```sh
git config local get remote.origin.url
```

### Lint Git unstaged PHP files
```sh
git status -s | grep -o ' \S*php$' | while read f; do php -l $f; done
```

### Get first Git commit hash
```sh
git log pretty=format:%H | tail -1
```

### Find the date of the first commit in a git repository
```sh
git rev-list all|tail -n1|xargs git show|grep -v diff|head -n1|cut -f1-3 -d' '
```

### See all the commits for which searchstring appear in the git diff
```sh
git log -p -z | perl -ln0e 'print if /[+-].*searchedstring/'
```

### Count git commits since specific commit
```sh
git log pretty=oneline b56b83.. | wc -l
```

### Git fetch all remote branches
```sh
git branch -r | awk -F'/' '{print "git fetch "$1,$2}' | xargs -I {} sh -c {}
```

### Show a git log with offsets relative to HEAD
```sh
git log oneline | nl -v0 | sed 's/^ \+/&HEAD~/'
```

### Delete specific remote 'origin' branch 'gh-pages'
```sh
git push origin :gh-pages
```

### get current git branch
```sh
git rev-parse symbolic-full-name abbrev-ref HEAD
```

### Top Ten of the most active committers in git repositories
```sh
git shortlog -s | sort -rn | head
```

### Serve one or more git repositories
```sh
git daemon reuseaddr verbose export-all base-path=/parent/of/bare/git/repos
```

### git diff external without additional script
```sh
git config global diff.external 'bash -c "meld $2 $5"'
```

### git-rm for all deleted files, including those with space/quote/unprintable characters in their filename/path
```sh
git ls-files -z -d | xargs -0 git rm 
```

### Delete first 10 branches from remote origin (exclude master)
```sh
git branch -a | grep "remotes/origin" | grep -v master | sed 's/^[ *]*//' | sed 's/remotes\/origin\///' | head -n10 | sed 's/^/git push origin :/' | bash
```

### delete local *and* remote git repos if merged into local master
```sh
git branch | cut -c3- | grep -v "^master$" | while read line; do git branch -d $line; done | grep 'Deleted branch' | awk '{print $3;}' | while read line; do git push <target_remote> :$line; done
```

### git commit message and body
```sh
git commit -m "commit title message" -m "commit body message";
```

### Create a git archive of the latest commit with revision number as name of file
```sh
git archive HEAD format=zip -o `git rev-parse HEAD`.zip
```

### Show hash and message of dangling git commits
```sh
git fsck lost-found | grep commit | cut -d " " -f 3 | xargs git show -s oneline
```

### Display file names that have common ancestors
```sh
git diff $(git merge-base master HEAD) name-only
```

### Number of commits per day in a git repository
```sh
git log | grep Date | awk '{print " : "$4" "$3" "$6}' | uniq -c
```

### Makes a project directory, unless it exists; changes into the dir, and creates an empty git repository, all in one command
```sh
gitstart () { if ! [[ -d "$@" ]]; then mkdir -p "$@" && cd "$@" && git init; else cd "$@" && git init; fi }
```

### Removing sensitive data from the entire repo history.
```sh
git filter-branch index-filter 'git rm cached ignore-unmatch FileToRemove' HEAD
```

### Creating a feature branch
```sh
git checkout -b myfeature develop
```

### Incorporating a finished feature on develop
```sh
git checkout develop; git merge no-ff myfeature
```

### Open (in vim) all modified files in a git repository
```sh
git status porcelain | sed -ne 's/^ M //p' | tr '\n' '\0' | tr -d '"' | xargs -0 vim
```

### Incorporating a finished feature on develop : Deleted branch myfeature
```sh
git branch -d myfeature
```

### Git log (commits titles) of today
```sh
git log after="yesterday" pretty=format:%s |uniq
```

### Find out what files are changed or added in a git repository.
```sh
git log name-only | less
```

### Get all git commits of a specific author in a nice format
```sh
git log name-status author="[The Author's Name]"
```

### Copy modified files between two Git commits
```sh
git diff name-only diff-filter=AMXTCR HEAD~2 HEAD | xargs -l -I{}  cp parents verbose "{}" target_dir
```

### Interactive rebase
```sh
git rebase -i SHA
```

### Remove tag git
```sh
git tag -d tagname
```

### git discard unstaged changes
```sh
git stash save keep-index
```

### git -  create a local branch that tracks with the remote branch
```sh
git checkout -tb mybranch origin/mybranch
```

### Git branches sorted by last commit date
```sh
git for-each-ref sort=-committerdate refs/heads/
```

### Better git diff, word delimited and colorized
```sh
git diff -U10|dwdiff diff-input -c|less -R
```

### git merge dry-run
```sh
git merge no-commit no-ff
```

### git branch point
```sh
git merge-base branch1 branch2
```

### Move all files untracked by git into a directory
```sh
git clean -n | sed 's/Would remove //; /Would not remove/d;' | xargs mv -t stuff/
```

### Remove branches that no longer exist from being shown via 'git branch -a'
```sh
git remote prune origin
```

### Remove all untracked files/directories from the working tree of a git repository.
```sh
git clean -dfx
```

### autocreate git tag
```sh
git tag rel`date +%Y-%m-%d%H-%M-%S` -m "(%) rel: stage"
```

### Show the changed files in your GIT repo
```sh
git status | perl -F'\s' -nale 'BEGIN { $a = 0 }; $a = 1 if $_ =~ /changed but not updated/i; print $F[-1] if ( $a && -f $F[-1] )'
```

### Diff 2 branches, for a type of file & having a string in the diff
```sh
git diff t1_clone tlocal4 name-only | grep -i "swift" | xargs git diff t1_clone tlocal4 word-diff-regex="NSLocalized"
```

### which git tags include this commit?
```sh
git tag -l contains 18f6f2 live*
```
