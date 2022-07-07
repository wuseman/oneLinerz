# parallel

### make directory
```sh
parallel -a <(seq 0 20) mkdir /tmp/dir1/{}
```

### Pull git submodules in parallel using GNU parallel
```sh
parallel -j4 cd {}\; pwd\; git pull :::: <(git submodule status | awk '{print $2}')
```

### To convert **.wav to **.mp3 using LAME running one process per CPU core run:
```sh
parallel -j+0 lame {} -o {.}.mp3 ::: *.wav
```

### simple port check command
```sh
parallel 'nc -z -v {1} {2}' ::: 192.168.1.10 192.168.1.11 ::: 80 25 110
```

### Compute the average number of KB per file for each dir
```sh
parallel  echo -n {}"\ "\;echo '$(du -s {} | awk  "{print \$1}") /  $(find {} | wc -l)' \| bc -l ::: *
```

### Batch Convert SVG to PNG (in parallel)
```sh
parallel convert {} {.}.png ::: *.svg
```

### Mapreduce style processing
```sh
parallel -j 50 ssh {} "ls" ::: host1 host2 hostn | sort | uniq -c
```

### Recompress all .gz files in current directory using bzip2 running 1 job per CPU core in parallel
```sh
parallel -j+0 "zcat {} | bzip2 >{.}.bz2 && rm {}" ::: *.gz
```

### Color code each job for GNU Parallel
```sh
parallel -j10 tagstring '\033[30;{=$_=++$::color%8+90=}m' sleep .3{}\;seq {} ::: {1..10}
```

### Pull git submodules in parallel using GNU parallel
```sh
parallel -j4 cd {}\; pwd\; git pull :::: <(git submodule status | awk '{print $2}')
```

### To convert **.wav to **.mp3 using LAME running one process per CPU core run:
```sh
parallel -j+0 lame {} -o {.}.mp3 ::: *.wav
```

### simple port check command
```sh
parallel 'nc -z -v {1} {2}' ::: 192.168.1.10 192.168.1.11 ::: 80 25 110
```

### Compute the average number of KB per file for each dir
```sh
parallel  echo -n {}"\ "\;echo '$(du -s {} | awk  "{print \$1}") /  $(find {} | wc -l)' \| bc -l ::: *
```

### Batch Convert SVG to PNG (in parallel)
```sh
parallel convert {} {.}.png ::: *.svg
```

### Mapreduce style processing
```sh
parallel -j 50 ssh {} "ls" ::: host1 host2 hostn | sort | uniq -c
```

### Recompress all .gz files in current directory using bzip2 running 1 job per CPU core in parallel
```sh
parallel -j+0 "zcat {} | bzip2 >{.}.bz2 && rm {}" ::: *.gz
```
