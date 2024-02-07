#!/bin/bash

# List of download links and corresponding file names
download_links=(
    "https://example.com/video.mp4"
    "https://example.com/audio.mp3"
    "https://example.com/image.jpg"
    "https://example.com/document.txt"
)

file_names=(
    "video.mp4"
    "audio.mp3"
    "image.jpg"
    "document.txt"
)

# Loop through the download links and file names
for ((i=0; i<${#download_links[@]}; i++)); do
    download_link="${download_links[i]}"
    file_name="${file_names[i]}"
    
    # Download the file
    wget -O "$file_name" "$download_link"
    
    # Check if the download was successful
    if [ $? -ne 0 ]; then
        echo "Error downloading file: $file_name"
    else
        echo "Downloaded file: $file_name"
    fi
done

# Check for files not correctly downloaded
for file_name in "${file_names[@]}"; do
    if [ ! -f "$file_name" ]; then
        echo "File not downloaded: $file_name"
    fi
done
