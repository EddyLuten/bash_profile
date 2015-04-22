# .bash_profile

The easiest way to use this is to clone this repo somewhere and then create a
symlink to the included `.bash_profile` file from your user directory (~).

Something like:

    cd ~
    ln -s /location/to/bash_profile/repo/.bash_profile .bash_profile

## What it does
1. Sets your default editor to vim
2. Adds git auto completion
3. Modifies the prompt to show git related information
4. If rbenv is available, will initialize it
5. Introduces many aliases (see below for a list)

## General Aliases
* `cd..` - alias for `cd ..`
* `cls` - alias for `clear`
* `ls` - alias for `ls -f1 -FGahp`
* `ll` - alias for `ls -l`
* `reload_profile` - reloads the `.bash_profile` file
* `trash` - moves a file to the trash
* `empty_trash` - empties the trash

## Rails Related Aliases
* `t` - clears the screen and runs `rake spec`

### Git Aliases
* `incoming` - shows incoming commits from origin for the current branch
* `outgoing` - shows outgoing commits to origin for the current branch
* `dirty-branches` - shows which branches are already merged into master and can be deleted
* `clean-branches` - deletes the dirty branches
* `gc` - alias for `git checkout`
* `gcm` - alias for `git checkout master`
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
