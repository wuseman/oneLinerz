# emerge 

### Double Compile system and world on gentoo
```sh
emerge -e system && emerge -e system && emerge -e world && emerge -e world
```

### Re-emerge all ebuilds with missing files (Gentoo Linux)
```sh
emerge -av1 `qlist installed nocolor | uniq | while read cp; do qlist exact $cp | while read file; do test -e $file || { echo $cp; echo "$cp: missing $file (and maybe more)" 1>&2; break; }; done; done`
```

### Update all ant packages installed in gentoo
```sh
emerge -q1 $(eix -C dev-java -I upgrade+ only-names ant)
```

### Re-emerge all ebuilds with missing files (Gentoo Linux)
```sh
emerge -a `qcheck -aCB`
```

### Re-emerge all ebuilds with missing files (Gentoo Linux)
```sh
emerge -av1 $(for e in `qlist -I nocolor | uniq`; do for f in `qlist -e $e`; do if test ! -e $f; then echo $e; echo $e: missing $f 1>&2; fi; done; done)
```

### For Gentoo users : helping with USE / emerge
```sh
emerge -epv world | grep USE | cut -d '"' -f 2 | sed 's/ /\n/g' | sed '/[(,)]/d' | sed s/'*'//g | sort | uniq > use && grep ^- use | sed s/^-// | sed ':a;N;$!ba;s/\n/ /g' > notuse && sed -i /^-/d use && sed -i ':a;N;$!ba;s/\n/ /g' use
```

### Gentoo portage easter egg
```sh
emerge moo
```

### Re-emerge all ebuilds with missing files (Gentoo Linux)
```sh
emerge -av1 `qlist installed nocolor | uniq | while read cp; do qlist exact $cp | while read file; do test -e $file || { echo $cp; echo "$cp: missing $file (and maybe more)" 1>&2; break; }; done; done`
```

### Update all ant packages installed in gentoo
```sh
emerge -q1 $(eix -C dev-java -I upgrade+ only-names ant)
```

### Re-emerge all ebuilds with missing files (Gentoo Linux)
```sh
emerge -a `qcheck -aCB`
```

### Re-emerge all ebuilds with missing files (Gentoo Linux)
```sh
emerge -av1 $(for e in `qlist -I nocolor | uniq`; do for f in `qlist -e $e`; do if test ! -e $f; then echo $e; echo $e: missing $f 1>&2; fi; done; done)
```

### For Gentoo users : helping with USE / emerge
```sh
emerge -epv world | grep USE | cut -d '"' -f 2 | sed 's/ /\n/g' | sed '/[(,)]/d' | sed s/'*'//g | sort | uniq > use && grep ^- use | sed s/^-// | sed ':a;N;$!ba;s/\n/ /g' > notuse && sed -i /^-/d use && sed -i ':a;N;$!ba;s/\n/ /g' use
```
