#!/bin/bash

#create generic tvshow.nfo template file

current_path=$(pwd)
current_dir=$(basename "$current_path")
if [[ $current_dir =~ (.*)\(([0-9]{4})\) ]]; then
  current_dir="${BASH_REMATCH[1]}"
  show_dir=$(echo "$current_dir" | sed -e 's/[[:space:]]*$//')
fi
cat << EOF > "tvshow.nfo"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<tvshow>
<title>$show_dir</title>
<thumb spoof="" cache="" aspect="poster" preview="cover.jpg">cover.jpg</thumb>
</tvshow>
EOF
