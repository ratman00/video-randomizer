#!/bin/bash
# generic boiler plate stuff. sets the shell to be used. probably shouldn't be changed.

echo "output filename:"
read filename
# prompts for a filename. will also be used to select output file format.

cd /home/rot/Documents/video-dir
# enters audio directory. change /home/rot/Documents/video-dir to whatever directory your input video files are.

video=$(ls -1d $PWD/*| shuf -n 1)
# picks a random file from the directory cd entered in the previous line.

cd /home/rot/Documents/audio-dir
# enters audio directory. change /home/rot/Documents/video-dir to whatever directory your input audio files are.

audio=$(ls -1d $PWD/* | shuf -n 1)
# picks a random file from the directory cd entered in the previous line.

cd /home/rot/Documents/output-dir
# changes location to output-dir. you can change the location to wherever you want.

ffmpeg -i $video -i $audio -c:v copy -map 0:v:0 -map 1:a:0 $filename
# takes $video and $audio and combines them into $filename. video will not be re-encoded to save time, but audio will to prevent issues.
