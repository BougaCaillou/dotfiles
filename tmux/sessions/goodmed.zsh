#!/bin/zsh

SESSION_NAME="goodmed"
GOODMED_DIR="$PROJECTS_DIR/goodmed"

# Checking if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  # Creating a new session
  tmux new-session -d -s $SESSION_NAME -n "editor" -c $GOODMED_DIR

  # Creating a new window (first window is for nvim)
  tmux renamew nvim
  tmux neww -n 'build/dev' -c $GOODMED_DIR

  # Splitting the window vertically
  tmux splitw -h -c $GOODMED_DIR
  tmux selectp -t 1
  tmux splitw -v -c $GOODMED_DIR

  # Going back to first winow since I probably want to start doing stuff
  tmux selectw -t 'nvim'
fi

# Attaching to the session
tmux attach -t $SESSION_NAME
