#!/bin/zsh

# Asking the user which session to start
SESSIONS=$(\
  for f in $(find $TMUX_HOME/sessions -name '*.zsh' -not -name 'ta.zsh'); \
  do echo $f | rev | cut -d'/' -f 1 | rev | cut -d'.' -f 1; \
  done \
  | gum filter --placeholder 'Which session bro?')

# Exit if no session is selected
if [ -z $SESSIONS ]; then
  echo "Ok bye!"
  exit
fi

# Start the session
zsh $TMUX_HOME/sessions/$SESSIONS.zsh

