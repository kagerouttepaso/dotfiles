#!/bin/bash

if $(tmux has-session 2> /dev/null); then
  tmux -2 attach -d
else
  tmux -2
fi
