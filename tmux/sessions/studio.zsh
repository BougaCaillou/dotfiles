#!/bin/zsh

SESSION_NAME="studio"
STUDIO_DIR="$PROJECTS_DIR/material/apps/studio"

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -s $SESSION_NAME -d -c $STUDIO_DIR
  tmux renamew 'nvim'

  tmux neww -n 'build/dev' -c $STUDIO_DIR
  tmux splitw -h -c $STUDIO_DIR

  tmux selectw -t 'nvim'
fi

tmux attach -t $SESSION_NAME

