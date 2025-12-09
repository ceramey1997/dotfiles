#!/bin/bash

# Install mise (development environment manager)

if command -v mise &> /dev/null; then
    echo "mise already installed. Exiting"
    CODE=0
    exit $CODE
fi

CODE=33

# Install mise using the official installer
curl https://mise.run | sh

echo "mise installed successfully"

exit $CODE
