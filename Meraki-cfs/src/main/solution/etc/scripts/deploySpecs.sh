#!/bin/bash
(set -o igncr) 2>/dev/null && set -o igncr; # comment is needed 
export SHELLOPTS
PATH="/bin:/usr/local/bin:/usr/bin:$PATH"
export PATH
# The above makes bash to work from windows, do not delete.

#set -x

if [ $# -gt 0 ]; then
  export ACTIVATOR_OPT="$1"
  export SOLUTION_HOME="$2"
fi

if [ -z "$ACTIVATOR_OPT" ]; then
  exit 1
fi
if [ -z "$SOLUTION_HOME" ]; then
  exit 1
fi

loadSpecs="$ACTIVATOR_OPT/solutions/DDE/bin/loadSpecs.sh"

# Load the DSDs
$loadSpecs -verbosity -1 -recurse $ACTIVATOR_OPT/solutions/$SOLUTION_HOME/etc/specs/
