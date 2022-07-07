# mkdocs

### Setup nav
```sh
    ls -1|awk '{print $1,$1}'|sed 's/ /: /g' |sed 's/^/     - /g'
```

### Create a cheatsheet
```sh
    cat parallel|sed '/##### /a```sh' | sed '/parallel/a ```' > /home/wuseman/m/docs/src/markdown/linux/parallel.md
```sh