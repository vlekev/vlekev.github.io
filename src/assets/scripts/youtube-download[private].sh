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

if [ -f "$1" ]; then
    yt-dlp --output-na-placeholder "Unknow" --no-playlist --audio-format mp3 -wx -o 'youtube-download/%(artist)s - %(title)s.%(ext)s' -a "$1"
    # youtube-dl -vvvv --proxy "socks5://127.0.0.1:9050/" --output-na-placeholder "Unknow" --no-playlist --audio-format mp3 -wx -o 'youtube-download/%(artist)s - %(title)s.%(ext)s' -a "$1"
else
    echo -e "Fichier de donnée '$1' inexistant" >&2
    exit 1
fi

