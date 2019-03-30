#!/usr/bin/env bash

## installation functions

install-ps1-extender() {
  echo ""
  echo "Beginning installation of ps1-extender"

  echo ""
  scr_path=$(realpath ./command-prompt.sh)
  home=$(realpath $HOME)
  bashrc_path=$home/.bashrc
  bash_helpers_dir=$home/.bash-helpers

  [[ ! -d "$home/.bash-helpers" ]] && mkdir $bash_helpers_dir echo "Created $bash_helpers_dir"

  ## copy file over
  cp $scr_path $bash_helpers_dir && echo "Copied over: $scr_path -> $bash_helpers_dir"

  echo "" >> $bashrc_path
  echo "" >> $bashrc_path
  echo "### ps1-extender added by bash-helpers" >> $bashrc_path

  echo "" >> $bashrc_path
  echo "source $home/.bash-helpers/command-prompt.sh" >> $bashrc_path
  echo "" >> $bashrc_path

  echo "Finished installing ps1-extender!"

}

## Installation screens

#### Main screen

cat << EOF

#######################
#                     #
#     Bash Helpers    #
#                     #
#######################

This is a set of utilities aimed at improving workflow.

The following set of questions will guide the installation process.

EOF

### Install PS1 extender?

cat << EOF

The PS1 extender will customize the bash prompt
to now display the following:

<username>@<host> HH:MM:SS files: <num-files>
~> </path/to/cwd>
\$ _


It will automatically detect when you are in a directory with a git repository
and display:

<username>@<host> HH:MM:SS files: <num-files>
~> </path/to/cwd>
[ git ~ <git-branch> || Add: <A> Mod: <M> Del: <D> Unt: <U> ]
\$ _

where:
  A - number of files added
  M - number of files modified
  D - number of files deleted
  U - number of files untracked


Would you like to install the PS1 extender? [Y/n]

EOF

read install_ps1

[[ "$ps1" == "Y" ]] && install-ps1-extender
