#!/bin/bash

## colors
BLUE='\[\033[01;34m\]'
RESET="\[\033[00m\]"

folders() {
	results=$(ls -la | grep -v '\.\.' | grep -v '\.' | grep '^d' | cut -d' ' -f 15)
	echo -e "$BLUE""$results""$RESET"
}
