# Bash helpers

This repo is where I'll be dumping various scripts aimed at improving my workflow and productivity.

For the moment I've only written some simple PS1 prompt formatting (command-prompt.sh).


### command-prompt.sh

Will reformat PS1 to display the following:

- current time
- current path
- # of files in current level of local directory
- typical user/login info
- auto-detect virtualenv (works with virtualenvwrapper as well!)
    - will display venv name
- auto-detect git repo
    - current branch
	- # of added/modified/deleted/untracked files

There are a few bugs of course, and I'll be posting fixes as I get around to them.
I've noticed that the modified count might not be as accurate as I think.


### Notes

Would ideally like to add support for svn, improve/expand the git info, a CLI-tool for configurability/customization, and more.

Another file I might add is one to perform typical tasks, such as cleaning up docker stuff, etc...

One thing to keep in mind, is to have a look at asynchronously loading features into bash, to not hog down the start-up times too much.
