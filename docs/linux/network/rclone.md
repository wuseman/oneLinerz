# rclone

## Setup
#
    rclone config
    <press N and follow the questions>

### Mount

    rclone mount cloud: --allow-non-empty --allow-other --debug-fuse -v  --vfs-cache-mode=full  /mnt/tmp

## Move

    rclone move source:path dest:path
    
    
### Delete

Remove the contents of path.  Unlike purge it obeys include/exclude filters so can be used to selectively delete files.

*Eg delete all files bigger than 100MBytes -heck what would be deleted first (use either)

    rclone --min-size 100M lsl remote:path
    rclone --dry-run --min-size 100M delete remote:path

### Then delete

    rclone --min-size 100M delete remote:path



### Copy

### Transfer file and ignore if file exist

    rclone copy cloud:/  -L --ignore-existing  --fast-list --max-backlog=999999         --drive-chunk-size=512M --transfers=145 --checkers=145 --buffer-size=8175M --verbose local/

### Transfer files from local PC to cloud

    rclone copy local_path/  -L --fast-list --max-backlog=999999 \
        --drive-chunk-size=512M --transfers=145 --checkers=145 --buffer-size=8175M --verbose cloud:/

### Transfer files from cloud to local PC

    rclone copy cloud:/  -L --fast-list --max-backlog=999999 \
        --drive-chunk-size=512M --transfers=145 --checkers=145 --buffer-size=8175M --verbose ~/cloud_backup

### Transfer file from cloud to local PC and show progress and also delete files after transfering is complete

    rclone copy cloud:/   -L --fast-list --max-backlog=999999 \
        --drive-chunk-size=512M --transfers=145 --checkers=145 --buffer-size=8175M --verbose ~/backup


