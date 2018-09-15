#!/bin/sh

echo "Please enter any letter"

read letter

if [[ $letter == [AEIOUaeiou]* ]]; then
  echo "Thank you. You have entered a vowel"
else
  echo "Thank you. You have entered a consonant"
fi
