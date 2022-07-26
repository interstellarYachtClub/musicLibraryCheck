#!/bin/bash
#This script in intended to be used with folders structured as
#Artist/Artist - Album with only a single level subdirectory
THISPATH=$(pwd)
ANYJPG=(*.jpg)
echo $THISPATH
printf "\n"
echo "***Running mediaserver info on $THISPATH***"
FOLDERCOUNT=$(ls |wc -l)
printf "\nThis path contains $FOLDERCOUNT distinct artists.\n\n\n"
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
    #echo "subfolder: $SUB"
    #echo "$SUB""folder.jpg"
    if test -f "$THISPATH/$FOLDER/$SUB/folder.jpg";
    then
      #echo "folder.jpg is present"
      printf "\033[0;32m$SUB""folder.jpg\033[0m\n"
    elif test -f "$THISPATH/$FOLDER/$SUB/folder.png";
    then
      #echo "folder.png is present"
      printf "$SUB""\033[0;32m folder.png\033[0m\n"
    elif test -f "$THISPATH/$FOLDER/$SUB"*.jpg; then
      #echo "$SUB contains artwork INCORRECTLY named"
      printf "$SUB \033[0;33m...contains artwork INCORRECTLY named \033[0m\n"
    else
      #echo "$SUB album cover is MISSING"
      printf "\033[31;4m$SUB\033[0m \033[0;31m...album cover is MISSING\033[0m\n"
    fi
  done
done
printf "\n"
