# musicLibraryCheck
A collection of modules for checking a personal music library organized to the plex/subsonic/jellyfin standard

## Description
This is a shell script. It is intended to be used with folders structured as 'Artist/Artist - Album' with only a single level subdirectory

## Example folder structure
Root Music Directory   
│
└───Artist0
│   │
│   └───Artist0 - Album321
│       │   track.audio
│       │   folder.jpg
│       │   ...
│
└───Artist1
│   │
│   └───Artist1 - AlbumXYZ
│       │   track.audio
│       │   folder.jpg
│       │   ...
|
|...
## Use
place musicLibraryCheck.sh into whatever bin dir you want to use
cd into the 'Root Music Directory'
execute musicLibraryCheck.sh
