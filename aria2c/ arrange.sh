#!/bin/bash
#=================================================================
# https://github.com/mogeko/dotfiles/tree/master/aria2c
# https://gist.github.com/Mogeko/64a20bc441cb43a7b26e416270c10168
# https://github.com/P3TERX/aria2.conf (upstream)
# File name：arrange.sh
# Description: Automatically organize files after Aria2 download is complete
# Lisence: MIT
# Author: Mogeko, P3TERX
# Blog: https://p3terx.com for P3TERX
#       https://mogeko.me  for Mogeko
#=================================================================

PRINTF_LOG=false

DOWNLOAD_PATH="$HOME/Downloads"
RELATIVE_PATH=${3#${DOWNLOAD_PATH}/}
TOP_PATH=${DOWNLOAD_PATH}/${RELATIVE_PATH}

COMPRESSED=("bz2" "gz" "xz" "lzma" "bz2" "rar" "tar" "tbz2" "tgz" "zip" "Z" "7z" "xz")
DOCUMENT=("txt" "chm" "pdf" "equb" "mobi" "azw3" "doc" "docx" "ppt" "pptx" "xls" "xlsx" "rtf" "pages" "key" "numbers" "odt" "odp" "ods")
MUSIC=("mp3" "flac" "aac" "aiff" "wav" "au" "ogg")
VIDEO=("mp4" "m4v" "mov" "avi" "flv" "wmv" "asf" "mpeg" "mpg" "vob" "mkv" "rm" "rmvb" "srt" "ass")

function move {
    if [ ! -e $2 ]; then
        mkdir -p $2
    fi
    mv $1 $2
}

function whatType {
    for iter in $@; do
        [ "${TOP_PATH##*.}"_ = "$iter"_ ]  && return $true
    done
    return $false
}

$PRINTF_LOG && mkdir -p "$HOME/.aria2/log"
$PRINTF_LOG && echo "$(date +"%m/%d %H:%M:%S") [NOTICE] Start organizing files" >> "$HOME/.aria2/log/arrange.log"
if [ "$2" = "0" ]; then
    exit 0;
elif [[ -f ${TOP_PATH} && "$2" -eq "1" ]]; then
    if whatType ${COMPRESSED[*]}; then
        $PRINTF_LOG && echo "File type is compressed file" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "Move ${TOP_PATH}" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "To   ${DOWNLOAD_PATH}/Compressed" >> "$HOME/.aria2/log/arrange.log"
        move ${TOP_PATH} ${DOWNLOAD_PATH}/Compressed
    elif whatType ${DOCUMENT[*]}; then
        $PRINTF_LOG && echo "File type is Documents" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "Move ${TOP_PATH}" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "To   ${DOWNLOAD_PATH}/Documents" >> "$HOME/.aria2/log/arrange.log"
        move ${TOP_PATH} ${DOWNLOAD_PATH}/Documents
    elif whatType ${MUSIC[*]}; then
        $PRINTF_LOG && echo "File type is Music" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "Move ${TOP_PATH}" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "To   ${DOWNLOAD_PATH}/Music" >> "$HOME/.aria2/log/arrange.log"
        move ${TOP_PATH} ${DOWNLOAD_PATH}/Music
    elif whatType ${VIDEO[*]}; then
        $PRINTF_LOG && echo "File type is Videos" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "Move ${TOP_PATH}" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "To   ${DOWNLOAD_PATH}/" >> "$HOME/.aria2/log/arrange.log"
        move ${TOP_PATH} ${DOWNLOAD_PATH}/Videos
    elif [ "${TOP_PATH##*.}"_ = "torrent"_ ]; then
        $PRINTF_LOG && echo "File type is Torrents" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "Move ${TOP_PATH}" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "To   ${DOWNLOAD_PATH}/Torrents" >> "$HOME/.aria2/log/arrange.log"
        move ${TOP_PATH} ${DOWNLOAD_PATH}/Torrents
    else
        $PRINTF_LOG && echo "Unknown file type" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "Move ${TOP_PATH}" >> "$HOME/.aria2/log/arrange.log"
        $PRINTF_LOG && echo "To   ${DOWNLOAD_PATH}" >> "$HOME/.aria2/log/arrange.log"
        mv ${TOP_PATH} ${DOWNLOAD_PATH}
    fi
elif [[ -d ${TOP_PATH%/*} && "$2" -ne "1" ]]; then
    $PRINTF_LOG && echo "File type is Folder" >> "$HOME/.aria2/log/arrange.log"
    $PRINTF_LOG && echo "Move ${TOP_PATH%/*}" >> "$HOME/.aria2/log/arrange.log"
    $PRINTF_LOG && echo "To   ${DOWNLOAD_PATH}" >> "$HOME/.aria2/log/arrange.log"
    mv ${TOP_PATH%/*} ${DOWNLOAD_PATH}
fi