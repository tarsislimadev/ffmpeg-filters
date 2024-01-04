#!/usr/bin/sh

datetime=$( date +%Y%m%d%H%M%S )

ffmpeg -i "v1.webm" \
  -filter_complex "[0:v] negate [a]; [0:v] hflip [b]; [0:v] edgedetect [c]; [0:v] [a] hstack=inputs=2 [top]; [b] [c] hstack=inputs=2 [bottom]; [top] [bottom] vstack=inputs=2 [out]" \
  -map "[out]" "${datetime}.mkv"
