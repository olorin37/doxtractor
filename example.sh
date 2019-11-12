#!/usr/bin/env bash

## @file  Example script with documentation for docex

## Example variable
declare -g g_example_var=17

## Example function.  Takes two arguments and does nothing, but printing "OK"
##
## @param param_a  This is first parameter.
## @param param_b  The second parameter.
## @output  Always "OK"
## @sideeffects  No side effects
example-function() {
  local param_a=$1
  local param_b=$2
  echo OK
}
