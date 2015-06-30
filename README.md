printerFinder（打印机搜寻器）
===

不知道你有没有碰到过打印机莫名其妙IP换掉的情况，找不到打印机很捉急啊！

printerFinder可以帮你快速找到打印机的地址！

依赖
---

```
apt-get install nmap # debian/ubuntu
yum install nmap     # redhat/centos
port install nmap    # mac

```

用法&示例
---

我们的目标是，给我一个网段（当然，IP也可以），就给你一批打印机！

```
Usage:
  ./printerFinder.sh -n [IP/NetworkSegment] [-p/-k] [Port/Keywords]

Example:
  ./printerFinder.sh -n 192.168.1.123 -p 9100
  ./printerFinder.sh -n 192.168.1.123 -k printer

  ./printerFinder.sh -n 192.168.1.0/24 -p 9100
  ./printerFinder.sh -n 192.168.1.0/24 -k printer

```

我们不生产打印机，我们只做打印机的搬运工:P

License
---

MIT
