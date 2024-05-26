{\rtf1\ansi\ansicpg1252\cocoartf2758
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
SOURCE_DIR=~/Desktop/archive/Images\
DEST_DIR=$(pwd)  # Current directory (flickr30k)\
BATCH_SIZE=1000  # Adjust the batch size as needed\
\
# Function to copy files in batches\
copy_files_in_batches() \{\
  local start=1\
  local end=$BATCH_SIZE\
  local total_files=$(find "$SOURCE_DIR" -type f | wc -l)\
\
  while [ $start -le $total_files ]; do\
    echo "Copying files $start to $((start + BATCH_SIZE - 1))"\
    find "$SOURCE_DIR" -type f | sed -n "$\{start\},$\{end\}p" | while IFS= read -r file; do\
      cp "$file" "$DEST_DIR"\
    done\
    start=$((end + 1))\
    end=$((end + BATCH_SIZE))\
  done\
\}\
\
copy_files_in_batches\
}