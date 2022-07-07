# gnupg

### Add below in .bashrc before you doing anything else

```sh
export GPG_TTY=$(tty)
```
### Print Version

```sh
gpg --version
```
### Test Clearsign

```sh
echo "test" | gpg --clearsign
```
### Print keyID (we need for mutt)

```sh
gpg --list-keys --with-colons <keyid>  | awk -F: '/^pub:/ { print $5 }'   
```
### Easier way to get keyid

```sh
gpg --list-signatures               
```

### Short key behind sub                

```sh
gpg --list-keys --keyid-format SHORT 
```
### Long key                      

```sh
gpg --list-keys --keyid-format LONG       
```

### Generate a new key

```sh
gpg --full-generate-key               
```

### List keys

```sh
gpg -k 
```
### List keys              

```sh
gpg --list-keys      
```
### List the keys in your secret key ring:   

```sh
gpg --list-secret-keys
```

### Export gpg key                                                                        
```sh
gpg -o key.gpg --export <KEY ID>   
gpg -o key.asc --armor --export <KEY ID>       
```

### Import keys 

```sh
gpg --import key.gpg
gpg --import key.asc  
```

### This will produce an encrypted file, secret.txt.  gpg, that can only be decrypted by the recipient

```sh
gpg -e -o secret.txt.gpg -r <RECIPIENT> secret.txt    
```

### Decrypting a file 

```sh
gpg -d -o secret.txt secret.txt.gpg     
```

### Create a tarball and encrypt it

```sh
tar czvpf - foo.txt| gpg --symmetric --cipher-algo TWOFISH -o foo.txt.tar.gz
```

### Decrypt and untar
```sh
gpg -d foo.txt.tar.gz.gpg | tar xzvf -
```sh
#### Encrypt file using a shared key. You will be prompted for a passphrase.       

```sh
gpg -c secret.txt 
```
### Sign a file               

```sh
gpg -o signed-file.txt.gpg -s file.txt
```

### Import keys from keyserver                                       
```sh
gpg --receive-keys <KEY IDS>
```

### Upload keys to keyserver                                                    

```sh
gpg --send-keys <KEY IDS>   
```

### Request updates from keyserver for keys already in your keyring

```sh
gpg --refresh-keys         
```

### Search keys from keyserver:   

```sh
gpg --search-keys "<SEARCH STRING>"     
```

### Override keyserver from `~/.gnupg/` to  `gpg.conf`     

```sh
gpg --keyserver <URL> ...                  
```

### Only merge updates for keys already in key-ring:        

```sh
gpg --import key.asc --merge-options merge-only                                            
```

### Trusting a key
```sh
gpg --edit-key <KEY ID>                                                                  
gpg> sign                                                                                
gpg> save                                                                                   
```

### Create a text file with the your messagage, save it to test.txt. Now we want to manual sign it

```sh
gpg --clearsign test.txt
```

### After entering password, we will get a new file named text.txt.asc, its signed, now we also want to verify this

```sh
gpg --verify test.txt.asc
```

### For encrypt our file

```sh
gpg --encrypt --armor test.txt
```

### For decrypt our file

```sh
gpg --decrypt encrypted.file
```

### Send key to key servers

```sh
gpg --export-options export-minimal --export  <KEY IDS> | curl -T - https://keys.openpgp.org
```

### Backup Key

```sh
gpg -o wuseman.gpg --export-options backup --export-secret-keys wuseman@nr1.nu
```
### Restore Backup

```sh
gpg --import-options restore --import wuseman.gpg
```
### Get some more info then keyid

```sh
gpg --list-packets backups/gnupg/<KEY IDS>.asc 
```

### Get keyid

```sh
gpg --list-packets ~/backups/gnupg/<KEY IDS>.asc  | awk '$1=="keyid:"{print$2}'
```

#### Delete key

```sh
gpg --delete-secret-keys <KEY IDS>
```
