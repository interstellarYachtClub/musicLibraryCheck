# musicLibraryCheck
A collection of modules for checking a personal music library organized to the plex/subsonic/jellyfin standard.

## Current Modules:
musicArtwork.sh

### Description: 
This is a shell script. It is intended to be used in a directory of music artist folders structured as 'Artist/Artist - Album' with only two levels of subdirectory below the script path

### Example folder structure
#### [See folder structure in raw](https://raw.githubusercontent.com/interstellarYachtClub/musicLibraryCheck/main/README.md)
Root Music Directory
//cd here and run the shell script from this level
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
### Use
place musicLibraryCheck.sh into whatever bin dir you want to use
cd into the 'Root Music Directory'
execute musicLibraryCheck.sh
