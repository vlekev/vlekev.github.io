#!/bin/bash

# if ! command -v youtube-dl > /dev/null; then
if ! command -v yt-dlp > /dev/null; then
    # sudo curl -L https://github.com/ytdl-org/ytdl-nightly/releases/latest/download/youtube-dl -o /usr/local/bin/youtube-dl
    # sudo chmod a+rx /usr/local/bin/youtube-dl
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp

    sudo ln -s $(which python3) /usr/bin/python
    sudo apt-get install -y ffmpeg
else
    # sudo youtube-dl -U
    sudo yt-dlp -U
fi

bdd=${1:-"bdd"}
target=${2:-"youtube-download"}

if [ -f "$bdd" ]; then
    yt-dlp --output-na-placeholder "Unknow" --no-playlist --audio-format mp3 -wx -o "$target/%(artist)s - %(title)s.%(ext)s" -a "$bdd"
    # youtube-dl -vvvv --proxy "socks5://127.0.0.1:9050/" --output-na-placeholder "Unknow" --no-playlist --audio-format mp3 -wx -o "$target/%(artist)s - %(title)s.%(ext)s" -a "$bdd"
else
    echo -e "Fichier de donnée '$bdd' inexistant" >&2
    exit 1
fi

