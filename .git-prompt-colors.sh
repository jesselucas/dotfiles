override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Lobo" # needed for reload optimization, should be unique

  # Place your overrides here
 	PathShort="\w";
	BYellow="\[\033[1;33m\]"
	IBlack="\[\033[0;37m\]"
	Green="\[\033[0;32m\]"

	GIT_PROMPT_PREFIX="${IBlack}(${ResetColor}" # Beginning of the git prompt
	GIT_PROMPT_SUFFIX="${IBlack})${ResetColor} " # End of the git prompt
	GIT_PROMPT_SEPARATOR="${Blue} ${ResetColor}" # Separator between files
	GIT_PROMPT_BRANCH="${Cyan}" # Current git branch
	GIT_PROMPT_STAGED="${Green}" # Number of staged files
	GIT_PROMPT_CONFLICTS="${Magenta}✖" # Number of files in conflict
	GIT_PROMPT_CHANGED="${Yellow}" # Number of changed files
	GIT_PROMPT_REMOTE=" " # Remote branch name
	GIT_PROMPT_UNTRACKED="${Cyan}" # Number of untracked files
	GIT_PROMPT_STASHED="${BoldBlue}" # Number of stashed files
	GIT_PROMPT_CLEAN="${Blue}✔" # Symbol indicating clean working directory
	GIT_PROMPT_SYMBOLS_AHEAD='↑' # Symbol used to show branch is ahead
	GIT_PROMPT_SYMBOLS_BEHIND='↓' # Symbol used to show branch is behin
	GIT_PROMPT_SYMBOLS_PREHASH=':'
	GIT_PROMPT_START="${ResetColor} "
	GIT_PROMPT_END="${ResetColor}${Green}$PathShort${ResetColor} ${IBlack}$ ${ResetColor} "
	GIT_PROMPT_LEADING_SPACE="0"
}

# load the theme
reload_git_prompt_colors "Custom"