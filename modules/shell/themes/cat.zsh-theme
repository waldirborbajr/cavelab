# Define Color Codes
colorOrange='%F{208}'  # FD971F
colorBlue='%F{81}'     # 6EC9DD
colorGreen='%F{118}'   # A6E22E
colorYellow='%F{222}'  # E6DB7E
colorPink='%F{199}'    # F92672
colorGrey='%F{240}'    # 554F48
colorWhite='%F{15}'    # F1F1F1
colorPurple='%F{141}'  # 9458FF
colorLilac='%F{183}'   # AE81FF
colorReset='%f'
userSymbol='⫸'

# Function to print text with a specified color
printWithColor() {
  echo -n "${1}${2}${colorReset}"
}

# Function to get the current directory name
getCurrentFolderName() {
  [[ $PWD == '/' ]] && echo '/' || basename "$PWD"
}

# Function to retrieve Git status codes
getGitStatusCodes() {
  git status --porcelain 2>/dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n'
}

# Function to get the current Git branch name
getGitBranchName() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Function to display a status icon with color based on Git status
displayStatusIcon() {
  [[ "$1" == *"$3"* ]] && printWithColor "$2" "彡ミ"
}

# Function to show Git status icons based on current Git status codes
showGitStatusIcons() {
  local gitStatus=$(getGitStatusCodes)

  displayStatusIcon "$gitStatus" "$colorPink" 'D'   # Deleted files
  displayStatusIcon "$gitStatus" "$colorOrange" 'R' # Renamed files
  displayStatusIcon "$gitStatus" "$colorWhite" 'C'  # Copied files
  displayStatusIcon "$gitStatus" "$colorGreen" 'A'  # Added files
  displayStatusIcon "$gitStatus" "$colorBlue" 'U'   # Unmerged files
  displayStatusIcon "$gitStatus" "$colorLilac" 'M'  # Modified files
  displayStatusIcon "$gitStatus" "$colorGrey" '?'   # Untracked files
}

# Function to display Git status in the prompt
displayGitStatus() {
  local branchName=$(getGitBranchName)

  if [[ -n "$branchName" ]]; then
    printWithColor "$colorBlue" " ☭ "
    printWithColor "$colorWhite" "$branchName"

    if [[ -n $(getGitStatusCodes) ]]; then
      printWithColor "$colorPink" ' ●'
      printWithColor "$colorWhite" ' (^._.^)ﾉ'
      showGitStatusIcons
    else
      printWithColor "$colorGreen" ' ○'
    fi
  fi
}

# Function to show the mode prompt (emulates Fish shell mode prompt)
showModePrompt() {
  echo -n "$colorLilac["
  case $KEYMAP in
    vicmd) echo -n "%F{red}n" ;;   # Normal mode (Vim command mode)
    viins) echo -n "%F{green}i" ;; # Insert mode (Vim insert mode)
    main|*) echo -n "%F{green}i" ;; # Default to insert mode
  esac
  echo -n "$colorLilac]$colorReset "
}

# Main prompt configuration
PROMPT='%{$(printWithColor $colorPurple "$(getCurrentFolderName)")%}$(displayGitStatus)
$(printWithColor $colorPink "'"$userSymbol  "'")'

