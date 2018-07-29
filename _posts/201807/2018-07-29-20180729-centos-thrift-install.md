---
title: centos7 下 thrift 的安装使用
date: 10:56 2018/7/29
---


官网说明： ``` http://thrift.apache.org/docs/install/centos ```

1. Update the System
``` sudo yum -y update ```

2. Install the Platform Development Tools
```sudo yum -y groupinstall "Development Tools"```

3. Upgrade autoconf/automake/bison
``` sudo yum install -y wget ```

4. Upgrade autoconf/automake/bison
``` sudo yum install -y wget ```

5. Upgrade autoconf
``` 
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar xvf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure --prefix=/usr
make
sudo make install
cd .. 
```

6.  Upgrade automake
``` 
wget http://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
tar xvf automake-1.14.tar.gz
cd automake-1.14
./configure --prefix=/usr
make
sudo make install
cd .. 
```

7. Upgrade bison
``` 
wget http://ftp.gnu.org/gnu/bison/bison-2.5.1.tar.gz
tar xvf bison-2.5.1.tar.gz
cd bison-2.5.1
./configure --prefix=/usr
make
sudo make install
cd .. 
```


