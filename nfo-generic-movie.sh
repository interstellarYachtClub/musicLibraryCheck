#!/bin/bash

# Loop through all .mkv files in the current directory
for mkv_file in *.mkv; do
    # Extract information from the .mkv filename
    movieTitle=$(basename "$mkv_file" | cut -d'(' -f1 | awk '{$1=$1};1')
    year=$(basename "$mkv_file" | sed -E 's/.*\(([0-9]{4})\).*/\1/')

    # Create the .nfo filename
    nfo_file="${mkv_file%.mkv}.nfo"

    # Create the .nfo file with the required content
    cat << EOF > "$nfo_file"
<?xml version="1.0" encoding="UTF-8"?>
<movie>
  <title>$movieTitle</title>
  <year>$year</year>
  <director></director>
  <thumb spoof="" cache="" aspect="poster" preview="cover.jpg">cover.jpg</thumb>
</movie>
EOF

    echo "Created $nfo_file"
    echo "movie name: $movieTitle"
    echo "year: $year"
done
