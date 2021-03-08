# generic boiler plate stuff. sets the shell to be used. probably shouldn't be changed.
#!/bin/bash

# prompts for a filename. will also be used to select output file format.
echo "output filename:"
read filename

# enters audio directory. change ~/Documents/video-dir to whatever directory your input video files are.
cd ~/Documents/video-dir

# picks a random file from the directory cd entered in the previous line.
video=$(ls -1d $PWD/*| shuf -n 1)

# enters audio directory. change ~/Documents/video-dir to whatever directory your input audio files are.
cd ~/Documents/audio-dir

# picks a random file from the directory cd entered in the previous line.
audio=$(ls -1d $PWD/* | shuf -n 1)

# changes location to output-dir. you can change the location to wherever you want.
cd /home/rot/Documents/output-dir

# takes $video and $audio and combines them into $filename. video will not be re-encoded to save time, but audio will to prevent issues.
ffmpeg -i $video -i $audio -c:v copy -map 0:v:0 -map 1:a:0 $filename