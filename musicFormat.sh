#!/bin/bash
#This script in intended to be used with folders structured as
#Artist/Artist - Album with only a single level subdirectory
THISPATH=$(pwd)
THISFILE=$(file -f)
flac=0
mp3=0
wavaiff=0
notaudio=0
unknownext=0
albumCount=0
trackCount=0
formats=(flac mp3 wav aiff)
printf "\n"
echo "===musicFormat.sh===="
echo "_________Path_________"
echo "$THISPATH"
printf "\n_____Format info_____\n"
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
    cd "$THISPATH/$FOLDER/$SUB"
    for file in *; do
    fileext=(${file: -4})
    if [[ $fileext == ".mp3" ]]; then
      printf "$file\n"
      printf "\033[0;33m-Stream friendly\033[0m\n"
      ((trackCount++))
      ((mp3++))
    elif [[ $fileext == ".wav" ]]; then
      printf "$file\n"
      printf "\033[0;32mDJ / club ready\033[0m\n"
      ((trackCount++))
      ((wavaiff++))
    elif [[ $fileext == ".aif" ]]; then
      printf "$file\n"
      printf "\033[0;32mDJ / club ready\033[0m\n"
      ((trackCount++))
      ((wavaiff++))
    elif [[ $fileext == ".flac" ]]; then
      ((trackCount++))
      ((flac++))
    elif [[ $fileext == ".jpg" ]]; then
      ((notaudio++))
    else
      ((unknownext++))
    fi
  done
done
done
printf "\n________Stats_________\n"
echo "Total number of albums: $albumCount"
echo "Total number of tracks: $trackCount"
echo "                  flac: $flac"
echo "                   mp3: $mp3"
echo "            wav / aiff: $wavaiff"
echo "   unrecognized format: $unknownext"
function flacpercent() {
  echo "scale=3; $flac / $trackCount" | bc
}
echo "          library flac: $(flacpercent)"
function mp3percent() {
  echo "scale=3; ($mp3 / $trackCount)" | bc
}
echo "           library mp3: $(mp3percent)"
function wavaiffpercent() {
  echo "scale=3; $wavaiff / $trackCount" | bc
}
echo "      library wav/aiff: $(wavaiffpercent)"
echo ""
