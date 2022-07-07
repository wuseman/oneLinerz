# ffmpeg

### Cut mp3 file from 30 seconds to 70

```sh
ffmpeg -ss 30 -t 70 -i inputfile.mp3 -acodec copy outputfile.mp3
```
### extract sound from movie file (-vn = no video)

```sh
ffmpeg -i input-video.mkv -vn -acodec copy output-audio.mp3
```
### same as above (it's best to use -q:a 0 for various bitrate)

```sh
ffmpeg -i sample.avi -q:a 0 -map a sample.mp3
```
### Cut mp3 file from 30 seconds to 70 only audi

```sh
ffmpeg -i Molle_Musikvideo_Jobba,_Jobba,_Jobba-26tzRuurdgo.mkv -ss 56 -t 61 -q:a 0 -map a molle_-_jobba.jobba.mp3
```
### Convert mp3 to ogg

```sh
ffmpeg -i input.mp3 -c:a libvorbis -q:a 4 output.ogg
```
### Convert all mp3 fifles in current dir to ogg
```sh
for f in ./*.mp3; do ffmpeg -i "$f" -c:a libvorbis -q:a 4 "${f/%mp3/ogg}"; done
```
### Convert all mp3 fifles in current dir to ogg recursive
```sh
find . -type f -name '*.mp3' -exec bash -c 'ffmpeg -i "$0" -c:a libvorbis -q:a 4 "${0/%mp3/ogg}"' '{}' \;
```
### Convert webm to mp3

```sh
ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";
```
### Convert many webm to mp3
```sh
find . -type f -iname "*.webm" -exec bash -c 'FILE="$1"; ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";' _ '{}' \;
```
### Convert many mkv to mp3
```sh
find . -type f -name "*.mkv" -exec bash -c 'FILE="$1"; ffmpeg -i "${FILE}" -vn -c:a libmp3lame -y "${FILE%.mkv}.mp3";' _ '{}' \;
```

### Cut from start to 34 seconds in video

```sh
ffmpeg -ss 00:00:00 -to 00:00:34 -i 20220404_235437.mp4 -c copy output.mp4
```
### Cut from start to 34 seconds in video and remove sound

```sh
ffmpeg -ss 00:00:00 -to 00:00:34 -i 20220404_235437.mp4 -c copy -an output.mp4
```

### Convert all flac files in dir to mp3 320kbps using ffmpeg
```sh
for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done;
```
###  Convert a music file (mp3) to a mp4 video with a static image 

```sh
ffmpeg -loop_input -i cover.jpg -i soundtrack.mp3 -shortest -acodec copy output_video.mp4
```

### Dumping Audio stream from flv (using ffmpeg)
```sh
ffmpeg -i input.flv -aq 2 output.mp3

```
### create 4 RTP streams (H264/AAC) from a single source with a single ffmpeg instance...
```sh
ffmpeg -i $src -an -vcodec [...details in description...] rtp rtp://$dstIP:$dstAudioPort4 -newaudio

```
### Audio processing from low quality to hear quality with sox
```sh
ffmpeg -loglevel 0 -y -i audio.mp3 -f sox - | sox -p -V -S -b24 -t audio.flac gain -3 rate -va 7056000 rate -v 48k

```
### Make webcam video
```sh
ffmpeg -f video4linux2 -s 320x240 -i /dev/video0 -f alsa -ac 1 -i default -f mp4 Filename.mp4

```
### Convert ogv video to avi using ffmpeg
```sh
ffmpeg -i input_demo.ogv -vcodec mpeg4 -qscale 0 -acodec libmp3lame my-demo-video.avi

```
### crop video using ffmpeg
```sh
ffmpeg -i my-demo-video.avi -filter:v "crop=820:750:200:0" -qscale 0  my-demo-video_cropped.avi

```
### extract images from video with framerate r
```sh
ffmpeg -i my-demo-video_cropped.mp4 -r 15/1 pic%03d.png

```
### create video from image series
```sh
ffmpeg -f image2 -r 15 -i pic.%04d.png -r 15 -b:v 8M vid15.avi

```
### ffmpeg -i movie.mpg -vhook '/usr/lib/vhook/watermark.so -f overlay.png -m 1 -t 222222' -an mm.flv
```sh
ffmpeg -i movie.mpg -vhook '/usr/lib/vhook/watermark.so -f overlay.png -m 1 -t 222222' -an mm.flv

```
### ffmpeg vhook imlib2.so
```sh
ffmpeg -i input.flv -vhook '/usr/lib/vhook/imlib2.so -c white -x 250 -y H+(-1.8*N+80) -t Hallo! -A max(0,255-exp(N/16))' -sameq -acodec copy output.flv

```
### Dumping Audio stream from flv (using ffmpeg)
```sh
ffmpeg -i <filename>.flv -vn <filename>.mp3

```
### Timelapse with ffmpeg (after symlinking pictures as per ffmpeg FAQ)
```sh
ffmpeg -r 12 -i img%03d.jpg -sameq -s hd720 -vcodec libx264 -crf 25 OUTPUT.MP4

```
### Quick and dirty convert to flash
```sh
ffmpeg -i inputfile.mp4 outputfile.flv

```
### Recording the desktop and an application audio source for webcast
```sh
ffmpeg -f alsa -ac 2 -i pulse -f x11grab -r 30 -s 1024x768 -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 ./Desktop/mydesktop.mkv

```
### cut audio file
```sh
ffmpeg -ss 00:00:30 -t 00:02:58 -i input.mp3 -acodec copy ouput.mp3

```
### Creating A Single Image Video With Audio via ffmpeg
```sh
ffmpeg -loop 1 -i image.png -i sound.mp3 -shortest video.mp4

```
### Convert .flv to .3gp
```sh
ffmpeg -i file.flv -r 15 -b 128k -s qcif -acodec amr_nb -ar 8000 -ac 1 -ab 13 -f 3gp -y out.3gp

```
### Capture video of a linux desktop
```sh
ffmpeg -f x11grab -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -r 25 -i :0.0 -sameq /tmp/out.mpg > /root/howto/capture_screen_video_ffmpeg

```
### Record audio and video from webcam using ffmpeg
```sh
ffmpeg -f alsa -r 16000 -i hw:2,0 -f video4linux2 -s 800x600 -i /dev/video0 -r 30 -f avi -vcodec mpeg4 -vtag xvid -sameq -acodec libmp3lame -ab 96k output.avi

```
### extracting audio and video from a movie
```sh
ffmpeg -i source_movie.flv -vcodec mpeg2video target_video.m2v -acodec copy target_audio.mp3

```
### Convert (almost) any video file into webm format for online html5 streaming
```sh
ffmpeg -i input_file.avi output_file.webm

```
### convert (almost) any image into a video
```sh
ffmpeg -loop_input -f image2 -r 30000/1001 -t $seconds -i frame/$num.ppm -y frame/%02d.mpeg 2>/dev/null

```
### Add an audio soundtrack to a series of images to create an flv
```sh
ffmpeg -t 300 -r '0.5' -i head-%03d.png -i ../TvQuran.com__144.mp3 -acodec copy muxed.flv

```
### Capture screen and mic input using FFmpeg and ALSA
```sh
ffmpeg -f alsa -itsoffset 00:00:02.000 -ac 2 -i hw:0,0 -f x11grab -s $(xwininfo -root | grep 'geometry' | awk '{print $2;}') -r 10 -i :0.0 -sameq -f mp4 -s wvga -y intro.mp4

```
### Cut out a piece of film from a file. Choose an arbitrary length and starting time.
```sh
ffmpeg -vcodec copy -acodec copy -i orginalfile -ss 00:01:30 -t 0:0:20 newfile

```
### Record MP3 audio via ALSA using ffmpeg
```sh
ffmpeg -f alsa -ac 2 -i hw:1,0 -acodec libmp3lame -ab 96k output.mp3

```
### fix flash video (flv) file (ffmpeg)
```sh
ffmpeg -i broken.flv -acodec copy -vcodec copy fixed.flv

```
### m4a to mp3 conversion with ffmpeg and lame
```sh
ffmpeg -i input.m4a -acodec libmp3lame -ab 128k output.mp3

```
### removing syncronization problems between audio and video
```sh
ffmpeg -i source_audio.mp3 -itsoffset 00:00:10.2 -i source_video.m2v target_video.flv

```
### Dump audio from video without re-encoding.
```sh
ffmpeg -i file.ext -acodec copy -vn out.ext

```
### Converting video file (.flv, .avi etc.) to .3gp
```sh
ffmpeg -i input.avi -s qcif -vcodec h263 -r 20 -b 180k -acodec libfaac -ab 64k -ac 2 -ar 22050 output.3gp

```
### Extract audio from Mythtv recording to Rockbox iPod using ffmpeg
```sh
ffmpeg -ss 0:58:15 -i DavidLettermanBlackCrowes.mpg -acodec copy DavidLettermanBlackCrowes.ac3

```
### Record a webcam output into a video file.
```sh
ffmpeg -an -f video4linux -s 320x240 -b 800k -r 15 -i /dev/v4l/video0 -vcodec mpeg4 myvideo.avi

```
### mix video and audio
```sh
ffmpeg -i video.mp4 -i audio.mp3 -vcodec copy -acodec copy -map 0.0:0 -map 1.0:1 mix.mp4

```
### Extract audio from Flash video `(*.flv) as mp3 file`
```sh
ffmpeg -i video.flv -vn -ar 44100 -ac 2 -ab 192k -f mp3 audio.mp3

```
### convert video to gif by ffmpeg and imagemagick
```sh
ffmpeg -i input.flv -vf scale=320:-1 -r 10 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - output.gif

```
### Screencast with ffmpeg x11grab
```sh
ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s $(xwininfo -root | grep 'geometry' | awk '{print $2;}') -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 -y output.mkv

```
### Convert (almost) any video file into webm format for online html5 streaming
```sh
ffmpeg -i input_file.mp4 -strict experimental output_file.webm

```
### Convert AVI to iPhone MP4
```sh
ffmpeg -i [source].avi -f mp4 -vcodec mpeg4 -b 250000 -s 480?320 -acodec aac -ar 24000 -ab 64 -ac 2 [destination].mp4

```
### convert plain .avi movies to .mpeg
```sh
ffmpeg -i movie.avi -y -f vcd -vcodec mpeg1video -map 0.0:0.0 -b 1150 -s 352x240 -r 29.97 -g 12 -qmin 3 -qmax 13 -acodec mp2 -ab 224 -ar 44100 -ac 2 -map 0.1:0.1 movie.mpg

```
### split large video file
```sh
ffmpeg -i 100_0029.MOV -ss 00:00:00 -t 00:04:00 100_0029_1.MOV

```
### Video thumbnail
```sh
ffmpeg -ss 5 -i video.avi -vframes 1 -s 320x240 thumb.jpg

```
### Extract audio from a video
```sh
ffmpeg -i input.mp4 -vn -acodec copy output.m4a

```
### extract audio from flv to mp3
```sh
ffmpeg -i input.flv -f mp3 -vn -acodec copy ouput.mp3

```
### ffmpeg command that transcodes a MythTV recording for Google Nexus One mobile phone
```sh
ffmpeg -i /var/lib/mythtv/pretty/Chuck20100208800PMChuckVersustheMask.mpg -s 800x480 -vcodec mpeg4 -acodec libfaac -ac 2 -ar 16000 -r 13 -ab 32000 -aspect 16:9 Chuck20100208800PMChuckVersustheMask.mp4

```
### Copy the sound content of a video to an mp3 file
```sh
ffmpeg -i source.flv -vn acodec copy destination.mp3

```
### Create a video that is supported by youtube
```sh
ffmpeg -i mymovie.mpg -ar 22050 -acodec libmp3lame -ab 32K -r 25 -s 320x240 -vcodec flv mytarget.flv

```
### DVD ripping with ffmpeg
```sh
ffmpeg -i concat:VTS_02_1.VOB\|VTS_02_2.VOB\|VTS_02_3.VOB\|VTS_02_4.VOB\|VTS_02_5.VOB -map 0:v:0 -map 0:a:0 -codec:a libvo_aacenc -ab 128 -codec:v libx264 -vpre libx264-ipod640 movie.mp4

```
### Convert a MOV captured from a digital camera to a smaller AVI
```sh
ffmpeg -i input.mov -b 4096k -vcodec msmpeg4v2 -acodec pcm_u8 output.avi

```
### Capture video of a linux desktop
```sh
ffmpeg -f x11grab -s wxga -r 25 -i :0.0+1366,0 -qscale 0 /tmp/out.mpg

```
### Extract audio from a video
```sh
ffmpeg -i video.avi -f mp3 audio.mp3

```
### Encode png's into blu-ray format
```sh
ffmpeg -r 24 -i %04d.png  -i INPUTSOUND -r 24 -aspect 16:9 -s 1920x1080 -vcodec libx264 -vpre hq -acodec ac3 -b 40000k -shortest -threads 0 OUTFILE.mp4

```
### Crop video starting at 00:05:00 with duration of 20 mins
```sh
ffmpeg -acodec copy -vcodec copy -ss 00:05:00 -t 00:20:00 -i file.mp4 file_cropped.mp4

```
### Convert flv without re-encoding
```sh
ffmpeg -i "$fin" -c copy -copyts "${fin%.*}.mp4"

```
### Cropping a video file in ffmpeg
```sh
ffmpeg -i inputfile.avi -croptop 88 -cropbottom 88 -cropleft 360 -cropright 360 outputfile.avi

```
### How to trim a video using ffmpeg
```sh
ffmpeg -i video.avi -vcodec copy -acodec copy -ss 00:00:00 -t 00:00:04 trimmed_video.avi

```
### Convert mkv to SVCD/DivX
```sh
ffmpeg -i movie.mkv -target vcd movie.avi

```
### video volume boost
```sh
ffmpeg -i input.ogv -vol $((256*4)) -vcodec copy output.ogv

```
### convert video format to youtube flv format
```sh
ffmpeg -i Your_video_file -s 320x240 FILE.flv

```
### Capture video Macbook webcam with cpu accelerated
```sh
ffmpeg -f avfoundation -framerate 30 -video_size 1280x720 -pix_fmt uyvy422  -i "0" -c:v h264_videotoolbox -profile:v high -b:v 3M -color_range 1 /tmp/out.mp4

```
### Playback Digital Cinema Package files through VLC using FFMPEG realtime encoding
```sh
ffmpeg -re -i VIDEODCP.mxf -i AUDIODCP.mxf -vcodec h264 -acodec aac -f mpegts udp://127.0.0.1:1234

```
### Revert a Digital Cinema Package back to a ProRes file, to (kind of) verify if the DCP creation wen't well
```sh
ffmpeg -i VIDEODCP.mxf -i AUDIODCP.mxf -vcodec h264 -acodec aac reverse-prores.mov

```
### Create mp4 from images
```sh
ffmpeg -i pic.%04d.png -c:v libx264 -vf fps=15 -pix_fmt yuv420p out.mp4

```
### Losslessly combine all MP3s in a directory (e.g. an audiobook)
```sh
ffmpeg -i "concat:$(find . -name "*.mp3" | sort | tr '\n' '|')" -acodec copy ../$(basename $(pwd)).mp3 && mp3val -f ../$(basename $(pwd)).mp3

```
### Rewrap an AVCHD (MTS/M2TS) video as MOV
```sh
ffmpeg -i "input.mts" -vcodec copy -acodec pcm_s16le "output.mov"

```
### Record grag desktop with ffmpeg
```sh
ffmpeg -f x11grab -r 25 -s 1280x720 -i :0.0+0,24 -vcodec libx264  -threads 0 /tmp/video.mkv

```
### ffmpeg convert  mkv to mp4
```sh
ffmpeg -i video.mkv -vcodec libx264 -crf 22 -threads 0 video.mp4

```
### Linux screenshot
```sh
ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq /home/ken/Desktop/moviemade1.mpg

```
### Encode a hq video +10mb/min to an 1mb/min suitable for youtube
```sh
ffmpeg -i in.mkv -acodec libfaac -ab 128k -ac 2 -vcodec libx264 -vpre max -crf 22 -threads 0 out.mp4

```
### Encode mkv file to ogg+h264+mkv
```sh
ffmpeg -i initial.mkv  -acodec libvorbis -ab 128k -ac 2 -vcodec libx264 -vpre max -crf 22 -threads 0 final.mkv

```
### Set volume to a mp3 file
```sh
ffmpeg -i foo.mp3 -vol 20 -acodec libmp3lame bar.mp3

```
### watermark a image on video
```sh
ffmpeg  -i out.mp4 -i logo.png3 -filter_complex "overlay=0:0" -codec:a copy out2.mp4 -y

```
### Record a screencast and convert it to an mpeg
```sh
ffmpeg -f x11grab -r 25 -s 800x600 -i :0.0 /tmp/outputFile.mpg

```
### Record a screencast and convert it to an mpeg
```sh
ffmpeg -f x11grab -r 25 -s 800x600 -i :0.0 /tmp/outputFile.mpg

```
### Bitperfect resample sound rendering
```sh
ffmpeg -loglevel 0 -y -i audio.mp3 -f sox - | sox -p -V -S -b24 -t audio.flac gain -3 rate -va 14112000 rate -v 96000

```
### Convert movie to psp format
```sh
ffmpeg -i "inputFile.avi" -f psp -r 29.97 -b 512k -ar 24000 -ab 64k -s 368x208 M4V00002.MP4

```
### Crop video starting at 00:05:00 with duration of 20 mins, also convert to mpeg4 with good quality
```sh
ffmpeg -i input.mpg -deinterlace -pix_fmt yuv420p -vcodec libx264 -preset slow -vprofile high -trellis 2 -crf 20 -ac 2 -ab 192k -f mp4 -ss 5:00.000 -to 25:00.000  output.avi

```
### convert movie to gif
```sh
ffmpeg -ss 00:00:00.000 -t 10 -i filename.avi -vf scale=320:-1 -r 10 /tmp/output.gif

```
### capture screen and mic
```sh
ffmpeg -f alsa -i default -f x11grab -s sxga -r 10 -i :0.0 -f mp4 -s vga -sameq out.mp4

```
### Convert .flv to .avi
```sh
ffmpeg -i file.flv file.avi

```
### ffmpeg facebook
```sh
ffmpeg -re -y -i mm.mp4 -b:a 128k -vcodec libx264 -pix_fmt yuv420p -vf scale=640:480 -r 30 -g 60 -f flv "rtmp://rtmp-api.facebook.com:80/rtmp/xxxxxxxxxx"

```
### ffmpeg m3u8 facebook live
```sh
ffmpeg -re -i "index.m3u8" -acodec libmp3lame  -ar 44100 -b:a 128k -pix_fmt yuv420p -profile:v baseline -s 426x240 -bufsize 6000k -vb 400k -maxrate 1500k -deinterlace -vcodec libx264 -preset veryfast -g 30 -r 30 -f flv "rtmp://rtmp-api.facebook.com"

```
### Convert flv/mp4 video to ogg/mp3
```sh
ffmpeg -i video.flv audio.ogg

```
### Use ffmpeg on a range of an image sequence.
```sh
ffmpeg -start_number 10 -i image-%04d.png -vframes 100 output.webm

```
### Stream a video file as  live stream
```sh
ffmpeg -re -i localFile.mp4 -c copy -f flv rtmp://server/live/streamName

```
### convert a .mp4 to a .avi
```sh
ffmpeg -i "/path/to/file.mp4" "/path/to/file.avi"

```
### Convert AVI to WMV
```sh
ffmpeg -i movie.avi -s 320x240 -b 1000k -vcodec wmv2 -ar 44100 -ab 56000 -ac 2 -y movie.wmv

```
### Converter mkv `(Blu-Ray_1280x540_AAC_5.1]_[10Bit]) para mp4 sem perder a qualidade`
```sh
ffmpeg -i input.mkv -vcodec copy -acodec copy -absf aac_adtstoasc output.m4v

```
### iMovie compatible ffmpeg transcoding
```sh
ffmpeg -i $video -c:v prores -profile:v 2 -c:a copy ${video}.mov

```
### Convert audio to video [m4a 2 mp4]
```sh
ffmpeg -loop 1 -i image.jpg -i audio.m4a -c:v libx264 -c:a aac -strict experimental -b:a 192k -vf scale=720:-1 -shortest video-output.mp4

```
### Convert a .ogv recording (eg from recordmydesktop in Gnome/Linux) into a .wmv (eg for playback in Windows)
```sh
ffmpeg -i input.ogv -qscale 0 output.wmv # convert .ogv to .wmv

```
### Rip audio from a video file.
```sh
ffmpeg -i file.video file.audio

```
### Burn ass subtitle in prores file
```sh
ffmpeg -i movie.mov -c:v prores -profile:v 1 -c:a pcm_s16le -vf subtitles=subtitle.ass subtitledmovie.mov

```
### add audio dub to proxy video for quality control purposes
```sh
ffmpeg -i AUDIOFILE.wav -i VIDEOFILE.mp4 OUTPUTFILE.mp4

```
### Capture video of a linux desktop
```sh
ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4

```
### Convert video file to sequence of images
```sh
ffmpeg -i source.mpg -r 24 -f image2 still-%6d.png

```
### Extract raw audio from video
```sh
ffmpeg -i source.mpg -f s16le -acodec pcm_s16le audio.raw

```
### avi to ogv (Ogg Theora)
```sh
ffmpeg2theora input.avi

```
### Dumping Audio stream from flv (using ffmpeg)
```sh
ffmpeg -i <filename>.flv -vn <filename>.mp3

```
### Quick and dirty convert to flash
```sh
ffmpeg -i inputfile.mp4 outputfile.flv

```
### Recording the desktop and an application audio source for webcast
```sh
ffmpeg -f alsa -ac 2 -i pulse -f x11grab -r 30 -s 1024x768 -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 ./Desktop/mydesktop.mkv

```
### cut audio file
```sh
ffmpeg -ss 00:00:30 -t 00:02:58 -i input.mp3 -acodec copy ouput.mp3

```
### Creating A Single Image Video With Audio via ffmpeg
```sh
ffmpeg -loop 1 -i image.png -i sound.mp3 -shortest video.mp4

```
### Convert .flv to .3gp
```sh
ffmpeg -i file.flv -r 15 -b 128k -s qcif -acodec amr_nb -ar 8000 -ac 1 -ab 13 -f 3gp -y out.3gp

```
### Capture video of a linux desktop
```sh
ffmpeg -f x11grab -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -r 25 -i :0.0 -sameq /tmp/out.mpg > /root/howto/capture_screen_video_ffmpeg

```
### Record audio and video from webcam using ffmpeg
```sh
ffmpeg -f alsa -r 16000 -i hw:2,0 -f video4linux2 -s 800x600 -i /dev/video0 -r 30 -f avi -vcodec mpeg4 -vtag xvid -sameq -acodec libmp3lame -ab 96k output.avi

```
### extracting audio and video from a movie
```sh
ffmpeg -i source_movie.flv -vcodec mpeg2video target_video.m2v -acodec copy target_audio.mp3

```
### Convert (almost) any video file into webm format for online html5 streaming
```sh
ffmpeg -i input_file.avi output_file.webm

```
### convert (almost) any image into a video
```sh
ffmpeg -loop_input -f image2 -r 30000/1001 -t $seconds -i frame/$num.ppm -y frame/%02d.mpeg 2>/dev/null

```
### Add an audio soundtrack to a series of images to create an flv
```sh
ffmpeg -t 300 -r '0.5' -i head-%03d.png -i ../TvQuran.com__144.mp3 -acodec copy muxed.flv

```
### Capture screen and mic input using FFmpeg and ALSA
```sh
ffmpeg -f alsa -itsoffset 00:00:02.000 -ac 2 -i hw:0,0 -f x11grab -s $(xwininfo -root | grep 'geometry' | awk '{print $2;}') -r 10 -i :0.0 -sameq -f mp4 -s wvga -y intro.mp4

```
### Cut out a piece of film from a file. Choose an arbitrary length and starting time.
```sh
ffmpeg -vcodec copy -acodec copy -i orginalfile -ss 00:01:30 -t 0:0:20 newfile

```
### Record MP3 audio via ALSA using ffmpeg
```sh
ffmpeg -f alsa -ac 2 -i hw:1,0 -acodec libmp3lame -ab 96k output.mp3

```
### fix flash video (flv) file (ffmpeg)
```sh
ffmpeg -i broken.flv -acodec copy -vcodec copy fixed.flv

```
### m4a to mp3 conversion with ffmpeg and lame
```sh
ffmpeg -i input.m4a -acodec libmp3lame -ab 128k output.mp3

```
### removing syncronization problems between audio and video
```sh
ffmpeg -i source_audio.mp3 -itsoffset 00:00:10.2 -i source_video.m2v target_video.flv

```
### Dump audio from video without re-encoding.
```sh
ffmpeg -i file.ext -acodec copy -vn out.ext

```
### Converting video file (.flv, .avi etc.) to .3gp
```sh
ffmpeg -i input.avi -s qcif -vcodec h263 -r 20 -b 180k -acodec libfaac -ab 64k -ac 2 -ar 22050 output.3gp

```
### Extract audio from Mythtv recording to Rockbox iPod using ffmpeg
```sh
ffmpeg -ss 0:58:15 -i DavidLettermanBlackCrowes.mpg -acodec copy DavidLettermanBlackCrowes.ac3

```
### Record a webcam output into a video file.
```sh
ffmpeg -an -f video4linux -s 320x240 -b 800k -r 15 -i /dev/v4l/video0 -vcodec mpeg4 myvideo.avi

```
### mix video and audio
```sh
ffmpeg -i video.mp4 -i audio.mp3 -vcodec copy -acodec copy -map 0.0:0 -map 1.0:1 mix.mp4

```
### Extract audio from Flash video `(*.flv) as mp3 file`
```sh
ffmpeg -i video.flv -vn -ar 44100 -ac 2 -ab 192k -f mp3 audio.mp3

```
### convert video to gif by ffmpeg and imagemagick
```sh
ffmpeg -i input.flv -vf scale=320:-1 -r 10 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - output.gif

```
### Screencast with ffmpeg x11grab
```sh
ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s $(xwininfo -root | grep 'geometry' | awk '{print $2;}') -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 -y output.mkv

```
### Convert (almost) any video file into webm format for online html5 streaming
```sh
ffmpeg -i input_file.mp4 -strict experimental output_file.webm

```
### Convert AVI to iPhone MP4
```sh
ffmpeg -i [source].avi -f mp4 -vcodec mpeg4 -b 250000 -s 480?320 -acodec aac -ar 24000 -ab 64 -ac 2 [destination].mp4

```
### convert plain .avi movies to .mpeg
```sh
ffmpeg -i movie.avi -y -f vcd -vcodec mpeg1video -map 0.0:0.0 -b 1150 -s 352x240 -r 29.97 -g 12 -qmin 3 -qmax 13 -acodec mp2 -ab 224 -ar 44100 -ac 2 -map 0.1:0.1 movie.mpg

```
### split large video file
```sh
ffmpeg -i 100_0029.MOV -ss 00:00:00 -t 00:04:00 100_0029_1.MOV

```
### Video thumbnail
```sh
ffmpeg -ss 5 -i video.avi -vframes 1 -s 320x240 thumb.jpg

```
### Extract audio from a video
```sh
ffmpeg -i input.mp4 -vn -acodec copy output.m4a

```
### extract audio from flv to mp3
```sh
ffmpeg -i input.flv -f mp3 -vn -acodec copy ouput.mp3

```
### ffmpeg command that transcodes a MythTV recording for Google Nexus One mobile phone
```sh
ffmpeg -i /var/lib/mythtv/pretty/Chuck20100208800PMChuckVersustheMask.mpg -s 800x480 -vcodec mpeg4 -acodec libfaac -ac 2 -ar 16000 -r 13 -ab 32000 -aspect 16:9 Chuck20100208800PMChuckVersustheMask.mp4

```
### Copy the sound content of a video to an mp3 file
```sh
ffmpeg -i source.flv -vn acodec copy destination.mp3

```
### Create a video that is supported by youtube
```sh
ffmpeg -i mymovie.mpg -ar 22050 -acodec libmp3lame -ab 32K -r 25 -s 320x240 -vcodec flv mytarget.flv

```
### DVD ripping with ffmpeg
```sh
ffmpeg -i concat:VTS_02_1.VOB\|VTS_02_2.VOB\|VTS_02_3.VOB\|VTS_02_4.VOB\|VTS_02_5.VOB -map 0:v:0 -map 0:a:0 -codec:a libvo_aacenc -ab 128 -codec:v libx264 -vpre libx264-ipod640 movie.mp4

```
### Convert a MOV captured from a digital camera to a smaller AVI
```sh
ffmpeg -i input.mov -b 4096k -vcodec msmpeg4v2 -acodec pcm_u8 output.avi

```
### Capture video of a linux desktop
```sh
ffmpeg -f x11grab -s wxga -r 25 -i :0.0+1366,0 -qscale 0 /tmp/out.mpg

```
### Extract audio from a video
```sh
ffmpeg -i video.avi -f mp3 audio.mp3

```
### Encode png's into blu-ray format
```sh
ffmpeg -r 24 -i %04d.png  -i INPUTSOUND -r 24 -aspect 16:9 -s 1920x1080 -vcodec libx264 -vpre hq -acodec ac3 -b 40000k -shortest -threads 0 OUTFILE.mp4

```
### Crop video starting at 00:05:00 with duration of 20 mins
```sh
ffmpeg -acodec copy -vcodec copy -ss 00:05:00 -t 00:20:00 -i file.mp4 file_cropped.mp4

```
### Convert flv without re-encoding
```sh
ffmpeg -i "$fin" -c copy -copyts "${fin%.*}.mp4"

```
### Cropping a video file in ffmpeg
```sh
ffmpeg -i inputfile.avi -croptop 88 -cropbottom 88 -cropleft 360 -cropright 360 outputfile.avi

```
### How to trim a video using ffmpeg
```sh
ffmpeg -i video.avi -vcodec copy -acodec copy -ss 00:00:00 -t 00:00:04 trimmed_video.avi

```
### Convert mkv to SVCD/DivX
```sh
ffmpeg -i movie.mkv -target vcd movie.avi

```
### video volume boost
```sh
ffmpeg -i input.ogv -vol $((256*4)) -vcodec copy output.ogv

```
### convert video format to youtube flv format
```sh
ffmpeg -i Your_video_file -s 320x240 FILE.flv

```
### Capture video Macbook webcam with cpu accelerated
```sh
ffmpeg -f avfoundation -framerate 30 -video_size 1280x720 -pix_fmt uyvy422  -i "0" -c:v h264_videotoolbox -profile:v high -b:v 3M -color_range 1 /tmp/out.mp4

```
### Playback Digital Cinema Package files through VLC using FFMPEG realtime encoding
```sh
ffmpeg -re -i VIDEODCP.mxf -i AUDIODCP.mxf -vcodec h264 -acodec aac -f mpegts udp://127.0.0.1:1234

```
### Revert a Digital Cinema Package back to a ProRes file, to (kind of) verify if the DCP creation wen't well
```sh
ffmpeg -i VIDEODCP.mxf -i AUDIODCP.mxf -vcodec h264 -acodec aac reverse-prores.mov

```
### Create mp4 from images
```sh
ffmpeg -i pic.%04d.png -c:v libx264 -vf fps=15 -pix_fmt yuv420p out.mp4

```
### Losslessly combine all MP3s in a directory (e.g. an audiobook)
```sh
ffmpeg -i "concat:$(find . -name "*.mp3" | sort | tr '\n' '|')" -acodec copy ../$(basename $(pwd)).mp3 && mp3val -f ../$(basename $(pwd)).mp3

```
### Rewrap an AVCHD (MTS/M2TS) video as MOV
```sh
ffmpeg -i "input.mts" -vcodec copy -acodec pcm_s16le "output.mov"

```
### Record grag desktop with ffmpeg
```sh
ffmpeg -f x11grab -r 25 -s 1280x720 -i :0.0+0,24 -vcodec libx264  -threads 0 /tmp/video.mkv

```
### ffmpeg convert  mkv to mp4
```sh
ffmpeg -i video.mkv -vcodec libx264 -crf 22 -threads 0 video.mp4

```
### Linux screenshot
```sh
ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq /home/ken/Desktop/moviemade1.mpg

```
### Encode a hq video +10mb/min to an 1mb/min suitable for youtube
```sh
ffmpeg -i in.mkv -acodec libfaac -ab 128k -ac 2 -vcodec libx264 -vpre max -crf 22 -threads 0 out.mp4

```
### Encode mkv file to ogg+h264+mkv
```sh
ffmpeg -i initial.mkv  -acodec libvorbis -ab 128k -ac 2 -vcodec libx264 -vpre max -crf 22 -threads 0 final.mkv

```
### Set volume to a mp3 file
```sh
ffmpeg -i foo.mp3 -vol 20 -acodec libmp3lame bar.mp3

```
### watermark a image on video
```sh
ffmpeg  -i out.mp4 -i logo.png3 -filter_complex "overlay=0:0" -codec:a copy out2.mp4 -y

```
### Record a screencast and convert it to an mpeg
```sh
ffmpeg -f x11grab -r 25 -s 800x600 -i :0.0 /tmp/outputFile.mpg

```
### Bitperfect resample sound rendering
```sh
ffmpeg -loglevel 0 -y -i audio.mp3 -f sox - | sox -p -V -S -b24 -t audio.flac gain -3 rate -va 14112000 rate -v 96000

```
### Convert movie to psp format
```sh
ffmpeg -i "inputFile.avi" -f psp -r 29.97 -b 512k -ar 24000 -ab 64k -s 368x208 M4V00002.MP4

```
### Crop video starting at 00:05:00 with duration of 20 mins, also convert to mpeg4 with good quality
```sh
ffmpeg -i input.mpg -deinterlace -pix_fmt yuv420p -vcodec libx264 -preset slow -vprofile high -trellis 2 -crf 20 -ac 2 -ab 192k -f mp4 -ss 5:00.000 -to 25:00.000  output.avi

```
### convert movie to gif
```sh
ffmpeg -ss 00:00:00.000 -t 10 -i filename.avi -vf scale=320:-1 -r 10 /tmp/output.gif

```
### capture screen and mic
```sh
ffmpeg -f alsa -i default -f x11grab -s sxga -r 10 -i :0.0 -f mp4 -s vga -sameq out.mp4

```
### Convert .flv to .avi
```sh
ffmpeg -i file.flv file.avi

```
### ffmpeg facebook
```sh
ffmpeg -re -y -i mm.mp4 -b:a 128k -vcodec libx264 -pix_fmt yuv420p -vf scale=640:480 -r 30 -g 60 -f flv "rtmp://rtmp-api.facebook.com:80/rtmp/xxxxxxxxxx"

```
### ffmpeg m3u8 facebook live
```sh
ffmpeg -re -i "index.m3u8" -acodec libmp3lame  -ar 44100 -b:a 128k -pix_fmt yuv420p -profile:v baseline -s 426x240 -bufsize 6000k -vb 400k -maxrate 1500k -deinterlace -vcodec libx264 -preset veryfast -g 30 -r 30 -f flv "rtmp://rtmp-api.facebook.com"

```
### Convert flv/mp4 video to ogg/mp3
```sh
ffmpeg -i video.flv audio.ogg

```
### Capture video of a linux desktop
```sh
ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4
```