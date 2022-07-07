# paste

### Print 2 files in columns
```sh
paste 1 2 | pr -t -e120                                                    
```
### Print 2 files in columns
```sh
paste -d '\n' 1 2 | xargs -d '\n' printf '%-50s  %-50s\n'                 
```
### Print 2 files in table

```sh
paste <(printf %s "$varA") <(printf %s "$varB")
paste -d' ' <(cut -f1 1) <(cut -d' ' -f2 2) |column -t
```