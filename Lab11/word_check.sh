#!/bin/bash

DICTIONARY="/usr/share/dict/words"

if [ ! -f "$DICTIONARY" ]; then
    echo "Error: Dictionary file not found at $DICTIONARY"
    echo "Try installing with: sudo apt install wamerican"  # For Ubuntu/Debian
    exit 1
fi

echo "Enter a word to check in dictionary:"
read word

word_lower=$(echo "$word" | tr '[:upper:]' '[:lower:]')

if grep -q "^${word_lower}$" "$DICTIONARY"; then
    echo "'$word' exists in the dictionary."
else
    echo "'$word' does not exist in the dictionary."
fi

