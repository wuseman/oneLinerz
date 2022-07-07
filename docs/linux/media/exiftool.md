# exiftool

How i edit, manipulates, injecting and writing and everything yuo can imagine about metadata will be found here with Phil Harvey's `exiftool` written in `perl`

###  Replace existing keyword list with two new keywords ("EXIF" and "editor").

```bash
exiftool -keywords=EXIF -keywords=editor ${FILENAME}.png
```

###  Copy a source image to a new file, and add a keyword ("word") to the current list of keywords.

```bash
exiftool -Keywords+=word -o newfile.jpg  ${FILENAME}.png
```

### Delete Credit information from all files in a  ${PATH}ectory where the Credit value was "xxx".

```bash
exiftool -credit-=xxx  ${PATH}
```

### Write alternate language for XMP:Description, using HTML character escaping to input special characters.

```bash
exiftool -xmp:description-de='k&uuml;hl' -E  ${FILENAME}.png
```

### Delete all meta information from an image.  

!!! Note: "You should NOT do this to RAW images (except DNG) since proprietary RAW image formats often contain information in the makernotes that is necessary for converting the image"

```bash
exiftool -all=  ${FILENAME}.png
```

### Delete all meta information from an image and add a comment back in.  

!!! important "Note that the order is important: `-comment=`lonely` -all=` would also delete the new comment."

```bash
exiftool -all= -comment='lonely'  ${FILENAME}.png
```

### Delete all meta information except JFIF group from an image.

```bash
exiftool -all= --jfif:all  ${FILENAME}.png
```

### Delete Photoshop meta information from an image (note that the Photoshop information also includes IPTC).

```bash
exiftool -Photoshop:All=  ${FILENAME}.png
```

### Adjust original date/time of all images in directory " ${PATH}" by subtracting one hour and 30 minutes.  

* This is equivalent to "-DateTimeOriginal-=1.5".  See Image::ExifTool::Shift.pl for details.

```bash
exiftool -DateTimeOriginal-='0:0:0 1:30:0'  ${PATH}
```

### Add 3 hours to the CreateDate and ModifyDate timestamps of two images.

```bash
exiftool -createdate+=3 -modifydate+=3 a.jpg b.jpg
```

### Shift the values of DateTimeOriginal, CreateDate and ModifyDate 

* Forward by 1 hour and 30 minutes for all Canon images in a  ${PATH}ectory.  
* (The AllDates tag is provided as a shortcut for these three tags, allowing them to be accessed via a single tag.)

```bash
 exiftool -AllDates+=100000:-30 -if '$make eq "Canon"'  ${PATH}
```

### Set all dates to 2012

```bash
exiftool -AllDates="2012:03:14 12:25:00"
```

### Create xmp files

```bash
exiftool -o %d%f.xmp  ${PATH}
```

### Set City

```bash
exiftool -xmp:city=Kingston i
```

### Print Megapixels

```bash
exiftool -Megapixels -if "$Make eq 'Sony'"
```

### Print GPS info

```bash
exiftool -Composite:GPSPosition
```

### Remove  all gps info 

```bash
exiftool -GPS*= -a
```

### remove ALL metadata run both

```bash
exiftool -ApertureValue="3.0" -EXIF:all=
exiftool -EXIF:all= -ApertureValue="3.0"
```

### Include some cool info 

```bash
$gpsPosition = $(exiftool -s -s -s -Composite:GPSPosition TestPic.jpg)
echo "This picture was taken at $gpsPosition"
```


### Timeshift Photos by One Year

```bash
exiftool "-AllDates+=1:0:0 0" .
```

### Rename files to datestamp

```bash
exiftool '-FileName<DateTimeOriginal' -d "%Y-%m-%d %H.%M.%S%%-c.%%e" .  
```

### Display all compoisites

```bash
exiftool -G -Composite:all
```

### Print values by alphanet sorted

```bash
exiftool -Sort -G -Composite:all$ {PATH}
```

### Rename Files to With Milliseconds

```bash
exiftool -v '-Filename<${datetimeoriginal}${subsectimeoriginal;$_.=0 x(3-length)}.%e' -d %Y%m%d_%H%M%S ${PATH}
```

### Set Date/Time Original date:

```bash
exiftool '-datetimeoriginal=2015:01:18 12:00:00' ${PATH}
```

### Edit File Modification Date/Time to same date as "date/time original" 

```bash
exiftool "-filemodifydate<datetimeoriginal"
```

### List all dates

```bash
exiftool -time:all -a -G0:1 -s
```

### Update any photo that doesn't have DateTimeOriginal to have it based on file modify date

```bash
exiftool '-datetimeoriginal<filemodifydate' -if '(not $datetimeoriginal or \ 
($datetimeoriginal eq "0000:00:00 00:00:00")) and ($filetype eq "JPEG")' ${PATH}
```

### The command alone will put the full filename in the comments.

* If you want to add the filename without the extension, add the example exiftool config file found here
	
```bash
exiftool "-AllDates=1986:11:05 12:00:00" -if '$filetype eq "JPEG"' ${PATH}
```
OR

```bash
find "${PATH} -name "*.jpg" | while read filename; do
   	exiftool "-AllDates=1986:11:05 12:00:00" "${FILENAME}";
done
```

### Set File Modification Date/Time  

```bash
exiftool "-FileModifyDate<XMP:DateTimeOriginal" \
         "-FileModifyDate<EXIF:CreateDate"       \
         "-FileModifyDate<XMP:CreateDate" \
         "-FileModifyDate<$IPTC:DateCreated $IPTC:TimeCreated" \
         "-FileModifyDate<EXIF:DateTimeOriginal" ${FILENAME}
```

