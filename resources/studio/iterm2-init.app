tell application "iTerm2"
  tell current window
    create tab with default profile
    create tab with default profile
    create tab with default profile
    create tab with default profile
    repeat with curr_tab in tabs
      create session with default profile
      create session with default profile
    end repeat
  end tell
end tell
