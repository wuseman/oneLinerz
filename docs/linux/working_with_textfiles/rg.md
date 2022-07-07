# ripgrep

### Set colors for matching in .bashrc
```sh
alias rg="rg --colors 'match:none' \
    --colors 'match:bg:0x33,0x66,0xFF' \
    --colors 'match:fg:white' \
    --colors 'match:style:bold'"
```

### List matching files only
```sh
rg -l clap	
```
### Files Without a Match
```sh
rg --files-without-match '\b(var|let|const)\b'
```
### Use -v to filter out all matches so that only non-matches are left.
```sh
rg 'bar' | rg -v 'foobar'
```

### Displays built-in available types and their corresponding globs
```sh
rg --type-list	
```
### Only search in .sh files, -g can be used mulitple tiomes
```sh
rg -g '*.shj' clap	
```
### Serach in all files excempt .sh files, -g can be used mulitple tiomes
```sh
 rg -g '!*.sh' clap	
```

### The following command restricts the search for the pattern key to json files only.
```sh
rg key -t json
```
### Very fast history search with Ripgrep
```sh
rh() { rg "$1" ~/.bash_history }

