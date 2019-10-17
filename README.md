# What is this
a simple bash script shows the power of nc(netcat)

# What does this do
It does something like ansible [Dynamic Inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html).
It receive http request from client, and save the reported node IP(encrypted with openssl)
to /etc/ansible/hosts or somewhere else.

# How does it work
This script do nothing but combine the awesome linux command togher:
- nc(netcat)
- grep
- sed
- dos2unix
- openssl
- curl

# Why Do I do this
The main point of doing this is to show the power of linux command.
You can use it as I ansible dynamic inventory if you know what you are doing, but 
it's not recommended to use this in production.

# Usage

## start the server

```bash
./server.sh
```

## start the server in backgroup

```bash
nohup ./server.sh & echo $! > run.pid;tail -f nohup.out
```

## stop server

```bash
kill `cat run.pid`
```

## start the client

```bash
PASSWORD=12345678Afz NODE_IP=192.168.1.111 ./client.sh
```
