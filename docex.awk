#!/usr/bin/awk -f

## @desc  Escape the string to be valid JSON string value
func escape(str) {
  # \\ \" \/ \n \b \t ...
  return str
}

## @desc  Generate path id of the doc sub item
func path_id(tag,
                  l_protopath) {
  l_protopath = "doc_item" "." tag
  return tag
}

{
  if (match($0, /## +@([a-z0-9]*)  +(.*)/, m)) {
    printf "%s = \"%s\";\n", m[1], escape(m[2])
  }
}
