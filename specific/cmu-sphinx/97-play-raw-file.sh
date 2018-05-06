#!/usr/bin/env bash
#Nothing to do with CMU Sphinx, but handy to play its test files.
# Play the raw sample file.
#This plays but there are probably issues with the parameters (sample rate,
# etc.). I got this from
# https://stackoverflow.com/q/20314739

#At any rate, it works to show what's in the file.

ffplay -f s16le -ar 16k -ac 1 goforward.raw
