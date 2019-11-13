#!/usr/bin/awk -f

BEGIN {
  doc_item_ix = 0
  current_tag_ix = 0
  current_tag = "desc"
  in_doc_block = 0 # 0 == false, 1 == true
}

## @desc  Escape the string to be valid JSON string value
func escape(str) {
  # \\ \" \/ \n \b \t ...
  return str
}

## @desc  Generate path id of the doc sub item
func path_id(tag,
                  l_protopath) {

  l_protopath = "doc_item[" doc_item_ix "]." tag "[" current_tag_ix "]"
  if (current_tag == tag) {
    current_tag_ix++
  } else {
    current_tag = tag
    current_tag_ix = 0
  }
  return l_protopath
}

{
  if (match($0, /## +@([a-z0-9]*)  +(.*)/, m)) {
    in_doc_block = 1
    printf "%s = \"%s\";\n", path_id(m[1]), escape(m[2])
  } else {
    if (in_doc_block == 1) { doc_item_ix++ }
    in_doc_block = 0
  }

}
