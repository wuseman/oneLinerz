# ssh-keygen

!!! tip "Descriptions for ssh-keygen (wuseman recommendations)"

### Create key
```sh
ssh-keygen -C "wuseman@nr1.nu" -t ed25519 -a 500 -f ~/.ssh/id_ed25519-$(date +%Y-%m-%d)
ssh-keygen -t rsa -b 8192 -f ~/.ssh/id_rsa-$(date +%Y-%m-%d) -C "wuseman@nr1.nu"

```

### Adding Your Key to SSH Agent
```ini
You can find your newly generated private key at ~/.ssh/id_ed25519 and 
your public key at ~/.ssh/id_ed25519.pub. Always remember that your public 
key is the one that you copy to the target host for authentication.
```

### Let us get ssh agent up and running before we adding ssh agent

```sh
eval "$(ssh-agent -s)"
```

### Add ssh-agent

```sh
ssh-add ~/.ssh/id_ed25519
```

### Add ssh-agent to private-key

```sh
ssh-add -K ~/.ssh/id_ed25519
```
### Specifying Specific Key to SSH into a Remote Server

```sh
ssh -i ~/.ssh/id_ed25519 wuseman@server.com
```

### OR - Add it to ~/.ssh/config

```ini
Host server
  HostName ipaddress
  User wuseman
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes

   And when saved, try: ssh server
```

### Check for already existing keys

```sh
for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq
```

### Rounds Slower is better, as slow as you can tolerate. Timing for different -a values, each measured 20 times:

```sh
for j in 16 32 64 100 150; do
    echo -n "-a $j takes on average";
     for i in {1..20}; do
         ssh-keygen -qa $j -t ed25519 -f test -N test;
         time ssh-keygen -qa $j -N tost -pP test -f test;
         rm test{.pub,};
     done |& grep real | awk -F m '{print $2}' | tr -d s | awk '{sum+=$1} END{print sum/NR}';
done
```

### References

[Upgrade your ssh key to ed25519](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54)

[PAM Module Instructions](https://github.com/google/google-authenticator/wiki/PAM-Module-Instructions)

[What are ssh-keygen best practices](https://security.stackexchange.com/questions/143442/what-are-ssh-keygen-best-practices)

