#!/bin/bash

# Example URL with dynamic filename
URL="https://archive.chirpmyradio.com/chirp_next/next-20250301/chirp-20250301-py3-none-any.whl"

# Extract filename using regex pattern
$URL =~ chirp-[^/]+-any\.whl ]]
FILENAME="${BASH_REMATCH[0]}"
echo "Successfully extracted filename: $FILENAME"

#   # Example: Download the file (remove 'echo' to actually download)
#   echo "curl -O $URL"
# else
#   echo "Error: Filename pattern not found in URL" >&2
#   exit 1
# fi
