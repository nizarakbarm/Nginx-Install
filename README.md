# Nginx-Install

This repository contains two script that can be used to install Nginx from Nginx's Repository.

There is two type of script which is provided at this repository:

- Nginx From Nginx Repository for Ubuntu which contains stable version (install_nginx_ubuntu_stable.sh)

- Nginx Mainline From Nginx Repository for Ubuntu which contains mainline version 1.25 (install_nginx_ubuntu_mainline.sh)

## How to Install

You need to download the script first. Then change permission of the script to use 755.

```
chmod 755 [script_file_name]
```

Then run the script:
```
./install_nginx_ubuntu_mainline.sh
```
or
```
./install_nginx_ubuntu_stable.sh
```

The script will inform the information of the Nginx and you will be prompted to type Y or y if you want to install the informed Nginx.