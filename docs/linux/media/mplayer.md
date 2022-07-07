# mplayer 

### Show webcam output
```sh
mplayer tv:// -tv driver=v4l:width=352:height=288
```

### Use mplayer to save video streams to a file
```sh
mplayer -dumpstream -dumpfile "yourfile" -playlist "URL"
```

### Play a random avi file in the current directory tree
```sh
mplayer $(find . -iname '*.avi' | shuf -n1)
```

### Start mplayer in the framebuffer
```sh
mplayer -vo fbdev $1 -fs -subcp ${2:-cp1251} -vf scale=${3:-1280:720}
```

### Shuffles your songs. Using mplayer. But with no output.
```sh
mplayer -shuffle $HOME/music/* $HOME/Dropbox/Music/*/* $HOME/Dropbox/Music/*/*/* etc. >> /dev/null 2>&1
```

### Play a random [album/movie] two rows down
```sh
mplayer "$(find . -maxdepth 2 -mindepth 2 -type d | grep -v '^.$' | sort -R | head -n1)"/*
```

### Play music radio from Z-103.5
```sh
mplayer http://38.100.101.69/CIDCFMAAC
```

### ASCII webcam live stream video using mplayer
```sh
mplayer -tv driver=v4l2:gain=1:width=640:height=480:device=/dev/video0:fps=10:outfmt=rgb16 -vo aa tv://
```

### Lire une video dans une console Linux
```sh
mplayer -vo caca foo.avi
```

### Increase mplayer maximum volume
```sh
mplayer dvd:// -softvol -softvol-max 500
```

### mplayer webcam window for screencasts
```sh
mplayer -cache 128 -tv driver=v4l2:width=176:height=177 -vo xv tv:// -noborder -geometry "95%:93%" -ontop
```

### Play 89.3 @TheCurrent and get system notifications on song changes.
```sh
mplayer http://minnesota.publicradio.org/tools/play/streams/the_current.pls < /dev/null | grep line-buffered "StreamTitle='.*S" -o | grep line-buffered "'.*'" -o > mus & tail -n0 -f mus | while read line; do notify-send "Music Change" "$line";done
```

### Using ASCII Art output on MPlayer
```sh
mplayer -vo aa <video file>
```

### Get information about a video file
```sh
mplayer -vo dummy -ao dummy -identify your_video.avi
```

### Stream YouTube URL directly to mplayer.
```sh
mplayer -fs -cookies -cookies-file /tmp/cookie.txt $(youtube-dl -g cookies /tmp/cookie.txt "http://www.youtube.com/watch?v=PTOSvEX-YeY")
```

### Get the total length of all videos in the current dir in H:m:s
```sh
mplayer -vo dummy -ao dummy -identify * 2>&1 | grep ID_LENGTH  | sed 's/.*=\([0-9]*\)/\1/' | xargs echo | sed 's/ /+/g' | bc | awk 'S=$1; {printf "%dh:%dm:%ds\n",S/(60*60),S%(60*60)/60,S%60}'
```

### use mplayer to watch Apple Movie Trailer instead of quicktime player
```sh
mplayer -rtsp-stream-over-tcp -user-agent QuickTime/7.6.4 http://trailers.apple.com/movies/HDmovie-h720p.mov
```

### View webcam output using mplayer
```sh
mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0:fps=30:outfmt=yuy2
```

### To play a file at 1.5 times normal speed  without increasing the pitch
```sh
mplayer -af scaletempo=scale=1.5 foo.mp3
```

### Extract audio from start to end position from a video
```sh
mplayer -vc null -vo null -ao pcm <input video file> -ss <start> -endpos <end>
```

### Mplayer save stream to file
```sh
mplayer -nolirc <Streaming_URL> -dumpstream -dumpfile output.mp3
```

### Watch Al Jazeera Livestream directly in mplayer #jan25
```sh
mplayer  $(wget -q -O - "http://europarse.real.com/hurl/gratishurl.ram?pid=eu_aljazeera&amp;file=al_jazeera_en_lo.rm" | sed -e 's#lo.rm#hi.rm#')
```

### Watch a movie in linux without the X windows system.
```sh
mplayer -vo fbdev -xy 1024 -fs -zoom /path/to/movie.avi
```

### Play ISO/DVD-files and activate dvd-menu and mouse menu clicks.
```sh
mplayer dvdnav:// -dvd-device foo.img -mouse-movements
```

### Instant mirror from your laptop + webcam
```sh
mplayer tv:// -vf mirror
```

### Normalize volume output in MPlayer
```sh
mplayer -af volnorm=2:0.75 dvd://
```

### Extract track 9 from a CD
```sh
mplayer -fs cdda://9 -ao pcm:file=track9.wav
```

### Play all the music in a folder, on shuffle
```sh
mplayer -shuffle *
```

### Listen Digitally Imported Radio from CLI (without premium!)
```sh
mplayer http://pub7.di.fm/di_ambient_aac?1 -user-agent "AudioAddict-di/3.2.0.3240 Android/5.1"
```

### Extracting frames from a video as jpeg files
```sh
mplayer -ao null -sid 999 -ss 00:15:45 -endpos 10 filename.avi -vo jpeg:outdir=out_frames
```

### mplayer -af scaletempo
```sh
mplayer -af scaletempo -speed 1.5 file.avi
```

### Downmix from stereo to mono and play radio stream with mplayer
```sh
mplayer -af pan=1:0.5:0.5 -channels 1 radiostream.pls
```

### Rip audio from a video file.
```sh
mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile <output-file> <input-file>
```

### Rip audio from a video file.
```sh
mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile <output-file> <input-file>
```

### play audio stream and video stream in two different mplayer instances
```sh
mplayer test.mp3 < /dev/null & mplayer test.avi -nosound -speed 1.0884
```

### Convert a mp3 file to m4a
```sh
mplayer -vo null -vc null -ao pcm:fast:file=file.wav file.mp3; faac -b 128 -c 44100 -w file.wav
```

### Watch movies in your terminal
```sh
mplayer -vo caca MovieName.avi
```

### Get movie length
```sh
mplayer -vo null -ao null -frames 0 -identify movie.avi | awk '{FS="="}; /ID_LENGTH/{ H=int($2/3600); M=int(($2-H*3600)/60); S=int($2%60); print H":"M":"S}'
```

### Play all files in the directory using MPlayer
```sh
mplayer -playlist <(find "$PWD" -type f)
```

### Instant mirror from your laptop + webcam (fullscreen+grab)
```sh
mplayer -fs -vf screenshot,mirror tv://
```

### DVD-Rip
```sh
mplayer dvd://1 -dumpstream -alang es -dumpfile "$dirDestino"/"$tituloDVD".mpg && ffmpeg -i "$dirDestino/$tituloDVD.mpg" -acodec libmp3lame -alang spa -vcodec libx264 -crf 26 -vpre hq -threads 0 "$dirDestino/$tituloDVD.mp4"
```

### Play radio stream with mplayer
```sh
mplayer -nolirc http://5253.live.streamtheworld.com/VIRGINRADIO_DUBAIAAC
```

### Watch YouTube and other Flash videos via mplayer (or whatever)
```sh
mplayer $(ls -t /tmp/Flash*|head -1)
```

### mplayer all flash videos being streamed in Chromium
```sh
mplayer $(ls -l /proc/$(pgrep -f flash)/fd/* |grep Flash | cut -d" " -f8)
```

### Play files with mplayer, including files in sub-directories, and have keyboard shortcuts work
```sh
mplayer -playlist <(find $PWD -type f)
```

### Extracting the audio part of a track as a wav file
```sh
mplayer -vc null -vo null -ao pcm <filename>
```

### Amplify movie playback
```sh
mplayer -af volume=10.1:0 $movie
```

### Put subtitles on black band in Mplayer
```sh
mplayer -vf-add scale=<SCREEN_WIDTH>:-3:::0.00:0.75 -vf-add expand=:<SCREEN_HEIGHT> -sub <SUBTITLE> <MOVIE>
```

### play high-res video files on a slow processor
```sh
mplayer -framedrop -vfm ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all
```

### Lossless DVD rips with
```sh
mplayer dvd://1 -dumpstream -dumpfile /tmp/file.mpg
```

### converts video to ascii art (txt) by mplayer and aa|caca lib
```sh
mplayer -vo aa:eight:driver=curses video.avi >video.txt
```

### Get the total length of all video / audio in the current dir in H:m:s
```sh
mplayer -endpos 0.1 -vo null -ao null -identify *.avi 2>&1 |grep ID_LENGTH |cut -d = -f 2|awk '{SUM += $1} END { printf "%d:%d:%d\n",SUM/3600,SUM%3600/60,SUM%60}'
```

### Get movie length
```sh
mplayer -vo null -ao null -frames 0 -identify movie.avi | awk '{FS="="}; /ID_LENGTH/{ H=int($2/3600); M=int(($2-H*3600)/60); S=int($2%60); printf "%d:%02d:%02d\n",H,M,S}'
```

### Using mplayer to play the audio only but suppress the video
```sh
mplayer -vo null something.mpg
```

### watch video youtube without flash but with mplayer and youtube-dl
```sh
mplayer $(youtube-dl -g http://youtube.com/example)
```

### Using mplayer to play the audio only but suppress the video
```sh
mplayer -novideo something.mpg
```

### Rip from mp3 stream mplayer
```sh
mplayer -cache 100 -dumpstream http://listen.di.fm/public3/drumandbass.pls -dumpfile music.mp3
```

### Shuffle songs with mplayer (sub-dirs too.)
```sh
mplayer -shuffle $HOME/music/* $HOME/music/*/* $HOME/music/*/*/* etc.
```

### don't have video stop at EOF while it is downloading
```sh
mplayer <(tail -fc +0 <filename>)
```

### Use mplayer to save video streams to a file
```sh
mplayer -dumpstream -dumpfile stream_video_name url
```

### Show webcam output
```sh
mplayer tv:// -tv driver=v4l:width=352:height=288
```

### Use mplayer to save video streams to a file
```sh
mplayer -dumpstream -dumpfile "yourfile" -playlist "URL"
```

### ASCII webcam live stream video using mplayer
```sh
mplayer -tv driver=v4l2:gain=1:width=640:height=480:device=/dev/video0:fps=10:outfmt=rgb16 -vo aa tv://
```

### Increase mplayer maximum volume
```sh
mplayer dvd:// -softvol -softvol-max 500
```

### mplayer webcam window for screencasts
```sh
mplayer -cache 128 -tv driver=v4l2:width=176:height=177 -vo xv tv:// -noborder -geometry "95%:93%" -ontop
```

### Play 89.3 @TheCurrent and get system notifications on song changes.
```sh
mplayer http://minnesota.publicradio.org/tools/play/streams/the_current.pls < /dev/null | grep line-buffered "StreamTitle='.*S" -o | grep line-buffered "'.*'" -o > mus & tail -n0 -f mus | while read line; do notify-send "Music Change" "$line";done
```

### Using ASCII Art output on MPlayer
```sh
mplayer -vo aa <video file>
```

### Get information about a video file
```sh
mplayer -vo dummy -ao dummy -identify your_video.avi
```

### Stream YouTube URL directly to mplayer.
```sh
mplayer -fs -cookies -cookies-file /tmp/cookie.txt $(youtube-dl -g cookies /tmp/cookie.txt "http://www.youtube.com/watch?v=PTOSvEX-YeY")
```

### Get the total length of all videos in the current dir in H:m:s
```sh
mplayer -vo dummy -ao dummy -identify * 2>&1 | grep ID_LENGTH  | sed 's/.*=\([0-9]*\)/\1/' | xargs echo | sed 's/ /+/g' | bc | awk 'S=$1; {printf "%dh:%dm:%ds\n",S/(60*60),S%(60*60)/60,S%60}'
```

### use mplayer to watch Apple Movie Trailer instead of quicktime player
```sh
mplayer -rtsp-stream-over-tcp -user-agent QuickTime/7.6.4 http://trailers.apple.com/movies/HDmovie-h720p.mov
```

### View webcam output using mplayer
```sh
mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0:fps=30:outfmt=yuy2
```

### To play a file at 1.5 times normal speed  without increasing the pitch
```sh
mplayer -af scaletempo=scale=1.5 foo.mp3
```

### Extract audio from start to end position from a video
```sh
mplayer -vc null -vo null -ao pcm <input video file> -ss <start> -endpos <end>
```

### Mplayer save stream to file
```sh
mplayer -nolirc <Streaming_URL> -dumpstream -dumpfile output.mp3
```

### Watch Al Jazeera Livestream directly in mplayer #jan25
```sh
mplayer  $(wget -q -O - "http://europarse.real.com/hurl/gratishurl.ram?pid=eu_aljazeera&amp;file=al_jazeera_en_lo.rm" | sed -e 's#lo.rm#hi.rm#')
```

### Watch a movie in linux without the X windows system.
```sh
mplayer -vo fbdev -xy 1024 -fs -zoom /path/to/movie.avi
```

### Play ISO/DVD-files and activate dvd-menu and mouse menu clicks.
```sh
mplayer dvdnav:// -dvd-device foo.img -mouse-movements
```

### Instant mirror from your laptop + webcam
```sh
mplayer tv:// -vf mirror
```

### Normalize volume output in MPlayer
```sh
mplayer -af volnorm=2:0.75 dvd://
```

### Extract track 9 from a CD
```sh
mplayer -fs cdda://9 -ao pcm:file=track9.wav
```

### Play all the music in a folder, on shuffle
```sh
mplayer -shuffle *
```

### Listen Digitally Imported Radio from CLI (without premium!)
```sh
mplayer http://pub7.di.fm/di_ambient_aac?1 -user-agent "AudioAddict-di/3.2.0.3240 Android/5.1"
```

### Extracting frames from a video as jpeg files
```sh
mplayer -ao null -sid 999 -ss 00:15:45 -endpos 10 filename.avi -vo jpeg:outdir=out_frames
```

### mplayer -af scaletempo
```sh
mplayer -af scaletempo -speed 1.5 file.avi
```

### Downmix from stereo to mono and play radio stream with mplayer
```sh
mplayer -af pan=1:0.5:0.5 -channels 1 radiostream.pls
```

### Rip audio from a video file.
```sh
mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile <output-file> <input-file>
```

### play audio stream and video stream in two different mplayer instances
```sh
mplayer test.mp3 < /dev/null & mplayer test.avi -nosound -speed 1.0884
```

### Convert a mp3 file to m4a
```sh
mplayer -vo null -vc null -ao pcm:fast:file=file.wav file.mp3; faac -b 128 -c 44100 -w file.wav
```

### Watch movies in your terminal
```sh
mplayer -vo caca MovieName.avi
```

### Get movie length
```sh
mplayer -vo null -ao null -frames 0 -identify movie.avi | awk '{FS="="}; /ID_LENGTH/{ H=int($2/3600); M=int(($2-H*3600)/60); S=int($2%60); print H":"M":"S}'
```

### Play all files in the directory using MPlayer
```sh
mplayer -playlist <(find "$PWD" -type f)
```

### Instant mirror from your laptop + webcam (fullscreen+grab)
```sh
mplayer -fs -vf screenshot,mirror tv://
```

### DVD-Rip
```sh
mplayer dvd://1 -dumpstream -alang es -dumpfile "$dirDestino"/"$tituloDVD".mpg && ffmpeg -i "$dirDestino/$tituloDVD.mpg" -acodec libmp3lame -alang spa -vcodec libx264 -crf 26 -vpre hq -threads 0 "$dirDestino/$tituloDVD.mp4"
```

### Play radio stream with mplayer
```sh
mplayer -nolirc http://5253.live.streamtheworld.com/VIRGINRADIO_DUBAIAAC
```

### Watch YouTube and other Flash videos via mplayer (or whatever)
```sh
mplayer $(ls -t /tmp/Flash*|head -1)
```

### mplayer all flash videos being streamed in Chromium
```sh
mplayer $(ls -l /proc/$(pgrep -f flash)/fd/* |grep Flash | cut -d" " -f8)
```

### Play files with mplayer, including files in sub-directories, and have keyboard shortcuts work
```sh
mplayer -playlist <(find $PWD -type f)
```

### Extracting the audio part of a track as a wav file
```sh
mplayer -vc null -vo null -ao pcm <filename>
```

### Amplify movie playback
```sh
mplayer -af volume=10.1:0 $movie
```

### Put subtitles on black band in Mplayer
```sh
mplayer -vf-add scale=<SCREEN_WIDTH>:-3:::0.00:0.75 -vf-add expand=:<SCREEN_HEIGHT> -sub <SUBTITLE> <MOVIE>
```

### play high-res video files on a slow processor
```sh
mplayer -framedrop -vfm ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all
```

### Lossless DVD rips with
```sh
mplayer dvd://1 -dumpstream -dumpfile /tmp/file.mpg
```

### converts video to ascii art (txt) by mplayer and aa|caca lib
```sh
mplayer -vo aa:eight:driver=curses video.avi >video.txt
```

### Get the total length of all video / audio in the current dir in H:m:s
```sh
mplayer -endpos 0.1 -vo null -ao null -identify *.avi 2>&1 |grep ID_LENGTH |cut -d = -f 2|awk '{SUM += $1} END { printf "%d:%d:%d\n",SUM/3600,SUM%3600/60,SUM%60}'
```

### Get movie length
```sh
mplayer -vo null -ao null -frames 0 -identify movie.avi | awk '{FS="="}; /ID_LENGTH/{ H=int($2/3600); M=int(($2-H*3600)/60); S=int($2%60); printf "%d:%02d:%02d\n",H,M,S}'
```

### Using mplayer to play the audio only but suppress the video
```sh
mplayer -vo null something.mpg
```

### Using mplayer to play the audio only but suppress the video
```sh
mplayer -novideo something.mpg
```
