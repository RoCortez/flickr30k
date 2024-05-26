#!/bin/bash

SOURCE_DIR=~/Desktop/archive/Images
DEST_DIR=$(pwd)  # Current directory (flickr30k)
BATCH_SIZE=1000  # Adjust the batch size as needed

# Function to copy files in batches
copy_files_in_batches() {
  local start=1
  local end=$BATCH_SIZE
  local total_files=$(find "$SOURCE_DIR" -type f | wc -l)

  while [ $start -le $total_files ]; do
    echo "Copying files $start to $((start + BATCH_SIZE - 1))"
    find "$SOURCE_DIR" -type f | sed -n "${start},${end}p" | while IFS= read -r file; do
      cp "$file" "$DEST_DIR"
    done
    start=$((end + 1))
    end=$((end + BATCH_SIZE))
  done
}

copy_files_in_batches
