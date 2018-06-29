git_info() {
    branch_name=$(git status -b -s 2>/dev/null | grep '##' | cut -d' ' -f 2)

    if [[ "$branch_name" == "" ]]; then
        branch_name="not a repo"
    fi

    echo "$branch_name"
}

git_branch() {
    is_inside_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

    if [[ "$is_inside_repo" == "true" ]]; then
        added=$(git status --short | cut -d' ' -f 1 | grep -c 'A')
        modified=$(git status --short | cut -d' ' -f 2 | grep -c 'M')
        deleted=$(git status --short | cut -d' ' -f 2 | grep -c 'D')
        untracked=$(git status --short | cut -d' ' -f 1 | grep -c '??')

#        branch_name="git: * $(git_info) || ""Added: $added Modified: $modified Deleted: $deleted Untracked: $untracked"
#        echo "[ $branch_name ]"

        branch_name="git ~ $(git_info) "
        status_output="Add: $added    Mod: $modified    Del: $deleted    Unt: $untracked"
		echo " 	"
        echo -n " ["
		echo -n ' '$branch_name
		echo -n ' || '$status_output
		echo " ]"
    else
        echo ""
    fi

}

get_branch_info() {
	b=$(git_branch)
	if [[ "$b" != "" ]]; then
		echo "$b"
	fi
}


# size helpers
files_count="\$(ls -1 | wc -l | sed 's: ::g')"
cur_files_size="\$(ls -lah | grep -m 1 total | sed 's/total //')"
# total_size='$( du -h -d 0 | cut -f 1 )'


# color helpers
RESET_COLOR='\[\033[00m\]'
RED='\[\033[01;31m\]'
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
YELLOW="\[\033[1;33m\]"



login_info='${debian_chroot:+($debian_chroot)}'$GREEN'\u@\h'$RESET_COLOR
time_var=$RED' \t'$RESET_COLOR


size_str=$YELLOW" files: $files_count "$RESET_COLOR

directory=$BLUE'\w'$RESET_COLOR

PROMPT_COMMAND='export git_str=$( get_branch_info )'

PS1="\n$login_info $time_var $size_str \n ~> $directory "'$git_str'" \n "'$ '




