#!/bin/bash

if [ -f $HOME/.local/bin/poetry ]; then
    echo "Poetry already installed. Exiting"
    CODE=0
    exit $CODE
fi
CODE=33
curl -ssL https://install.python-poetry.org | python3 -

exit $CODE
