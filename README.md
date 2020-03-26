# bash-ipset-blacklist
Ban and unban IP or IP subnet simple with commands.

#### 1. Install IPset (CentOS)
```
sudo yum install ipset
```

#### 2. Setup hashmap
```
firewall-cmd --permanent --new-ipset=blacklist --type=hash:net && firewall-cmd --permanent --zone=drop --add-source=ipset:blacklist && firewall-cmd --permanent --ipset=blacklist --add-entries-from-file=/etc/ipset-blacklist.txt
```

#### 3. Reload firewall
```
firewall-cmd --reload
```

## Commands

#### Ban IP or IP subnet on machine
```
ban.sh 10.20.30.40
```

#### Unban IP or IP subnet on machine
```
unban.sh 10.20.30.40
```
