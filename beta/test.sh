#!/bin/bash
set -a
shopt -s nullglob globstar

clear

coin=100

source functions.bashrc
source vars.bashrc

linkstart
##	debug
calc

bonus ${bonus[@]}
