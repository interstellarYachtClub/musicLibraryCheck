#!/bin/bash
#This script in intended to be used with folders structured as
#Artist/Artist - Album with only a single level subdirectory
THISPATH=$(pwd)
ANYJPG=(*.jpg)
artworkIncorrect=0
artworkMissing=0
artworkCorrect=0
albumCount=0
#
printf "\n"
echo "===musicArtwork.sh===="
echo "_________Path_________"
echo "$THISPATH"
printf "\n_____Artwork info_____\n"
shopt -s nullglob
FOLDERLIST=(*/)
shopt -u nullglob
ALLFOLDERS=$(printf "%s\n" "$FOLDERLIST[@]")
for FOLDER in "${FOLDERLIST[@]}"; do
  cd "$THISPATH/$FOLDER"
  shopt -s nullglob
  SUBLIST=(*/)
  shopt -u nullglob
  for SUB in "${SUBLIST[@]}"; do
    ((albumCount++))
    if test -f "$THISPATH/$FOLDER/$SUB/folder.jpg";
    then
      ((artworkCorrect++))
      #echo "folder.jpg is present"
      printf "\033[0;32m$SUB""...album artwork FOUND\033[0m\n"
    elif test -f "$THISPATH/$FOLDER/$SUB/folder.png";
    then
      ((artworkCorrect++))
      #echo "folder.png is present"
      printf "\033[0;32m$SUB""...album artwork FOUND\033[0m\n"
    elif test -f "$THISPATH/$FOLDER/$SUB"*.jpg; then
      #echo "$SUB album artwork INCORRECTLY named"
      ((artworkIncorrect++))
      printf "$SUB \033[0;33m...album artwork named INCORRECTLY\033[0m\n"
    else
      #echo "$SUB album artwork is MISSING"
      ((artworkMissing++))
      printf "\033[31;4m$SUB\033[0m \033[0;31m...album artwork is MISSING\033[0m\n"
    fi
  done
done
printf "\n________Stats_________\n"
echo "Total number of albums: $albumCount"
echo "Album artwork found: $artworkCorrect"
echo "Album artwork misnamed: $artworkIncorrect"
echo "Album artwork missing: $artworkMissing"
echo ""
