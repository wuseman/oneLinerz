# kernel

### Turn off one screen at boot or set custom resolution in bootloader

```sh
video=LVDS-1:d
video=<conn>:<xres>x<yres>[M][R][-<bpp>][@<refresh>][i][m][eDd]

<conn>: Connector, e.g. DVI-I-1, see /sys/class/drm/ for available connectors
<xres> x <yres>: resolution
M: compute a CVT mode?
R: reduced blanking?
-<bpp>: color depth
@<refresh>: refresh rate
i: interlaced (non-CVT mode)
m: margins?
e: output forced to on
d: output forced to off
: digital output forced to on (e.g. DVI-I connector)
video=DVI-I-1:1024x768@85 video=TV-1:d
```

### Find connected screens

```sh
for p in /sys/class/drm/*/status; do 
	con=${p%/status}; echo -n "${con#*/card?-}: "; 
	cat $p; 
done
```