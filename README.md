# .bash_profile

The easiest way to use this is to clone this repo somewhere and then create a
symlink to the included `.bash_profile` file from your user directory (~).

Something like:

    cd ~
    ln -s /location/to/bash_profile/repo/.bash_profile .bash_profile

## What it does
1. Sets your default editor to vim
2. Adds [git auto completion](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
3. Modifies the prompt [to show git related information](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
4. If rbenv is available, will initialize it
5. Introduces many aliases (see below for a list)

## General Aliases
* `bi` - alias for `bundle install`
* `bu` - alias for `bundle update`
* `fs` - alias for `foreman start`
* `cd..` - alias for `cd ..`
* `cls` - alias for `clear`
* `ls` - alias for `ls -f1 -FGahp`
* `ll` - alias for `ls -l`
* `reload_profile` - reloads the `.bash_profile` file
* `update_profile` - `git pull` in the `~/bash_profile` directory and reloads
* `trash` - moves a file (or anything matching a glob pattern) to the trash
* `empty_trash` - empties the trash
* `hitch` - an alias for using [hitch](https://github.com/therubymug/hitch).
* `unhitch` - the opposite of `hitch`

## Rails Related Aliases
* `t` - clears the screen and runs `rake spec`

### Git Aliases
* `incoming` - shows incoming commits from origin for the current branch
* `outgoing` - shows outgoing commits to origin for the current branch
* `dirty-branches` - shows which branches are already merged into master and can be deleted
* `clean-branches` - deletes the dirty branches
* `push-branch` - pushes the current branch to origin (`git push --set-upstream...`)
* `gc` - alias for `git checkout`
* `gcm` - alias for `git checkout master`
* `gcd` - alias for `git checkout development`
* `gp` - alias for `git pull`
* `gs` - alias for `git status`
* `gr` - undoes the latest local commit and stages the files
* `grr` - undoes all local commits and resets the branch to `HEAD`. **Warning:** hard reset.
* `ci` - alias for `git commit -a`
* `gb` - creates a new branch (first argument) and checks it out
* `gd` - deletes a branch (first argument)
* `gl` - lists all the local branches with their remotes and the last commit message
* `gla` - lists all the branches (local + remote) with their remotes and the last commit message
* `glr` - lists only remote branches with their last commit message
