#!/bin/bash

# Loop through all .mkv files in the current directory
for mkv_file in *.mkv; do
    # Extract information from the .mkv filename
    showName=$(basename "$mkv_file" | cut -d'(' -f1 | awk '{$1=$1};1')
    year=$(basename "$mkv_file" | sed -E 's/.*\(([0-9]{4})\).*/\1/')
    seasonNumber=$(basename "$mkv_file" | sed -E 's/.*s([0-9]+)e[0-9]+.*/\1/')
    episodeNumber=$(basename "$mkv_file" | sed -E 's/.* - s([0-9]+)e([0-9]+) - (.*)\..*/\2/')
    episodeTitle=$(basename "$mkv_file" | sed -E 's/.*- (.*)\..*/\1/')

    # Create the .nfo filename
    nfo_file="${mkv_file%.mkv}.nfo"

    # Create the .nfo file with the required content
    cat << EOF > "$nfo_file"
<?xml version="1.0" encoding="UTF-8"?>
<episodedetails>
  <title>$episodeTitle</title>
  <showtitle>$showName</showtitle>
  <season>$seasonNumber</season>
  <episode>$episodeNumber</episode>
  <thumb spoof="" cache="" aspect="poster" preview="cover.jpg">cover.jpg</thumb>
</episodedetails>
EOF

    echo "Created $nfo_file"
    echo "title: $showName"
    echo "year: $year"
    echo "season: $seasonNumber"
    echo "episode: $episodeNumber"
    echo "name: $episodeTitle"
done
