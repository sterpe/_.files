set_prompt () {
	Last_Command=$? # Must come first!
	PS1=""
	PS1+=`date "+%H:%M:%S"`
	PS1+=" "
	branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null )"
	git_command=$?
		PS1+="[\!"
		PS1+="\\\\"
		PS1+="${Last_Command}"
	if [[ $git_command == 0 ]]; then 
		PS1+=" ${branch}]"
	else
		PS1+="]"
	fi
	PS1+=" "
	PS1+="<\u@\h:\w> "
	PS1+="$ "
}

PROMPT_COMMAND="set_prompt; $PROMPT_COMMAND"
# PROMPT_COMMAND="set_prompt; history -a; history -c;\
#  history -r; $PROMPT_COMMAND"

PS2='  '

HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize

function eighty_columns() {
	a="      +8     +16     +24     +32     +40"
	b="     +48     +56     +64     +72     +80"
	echo "$a$b"
}
function ccl() {
	/usr/bin/clear
	eighty_columns
}
function path() {
	echo "$PATH"
}
function la() {
	ls -fF "$@"
}
function ll() {
	ls -fl "$@"
}
function show.files() {
	defaults write com.apple.finder AppleShowAllFiles YES
}
function hide.files() {
	defaults write com.apple.finder AppleShowAllFiles NO
}

export -f eighty_columns
export -f ccl
export -f path
export -f la
export -f ll
