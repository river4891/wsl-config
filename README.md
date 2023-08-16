# wsl-config

this repo just build for OCR in WSL.

## [install distribute](https://learn.microsoft.com/en-us/windows/wsl/install)

```powershell
# reffence: https://learn.microsoft.com/en-us/windows/wsl/install

wsl --list --online

# set version of WSL2
wsl --set-default-version 2

# look up distribute in your PC
wsl -l -v

# notice: just choose Ubuntu in WSL so that easy install CUDA by NVIDIA Office website.
wsl --install -d Ubuntu-22.04

# notice remember your password in WSL when you was installing WSL distribute

```

## WSL config

your can lookup: https://learn.microsoft.com/en-us/windows/wsl/wsl-config
in `./etc/wsl.conf`

## apt source

### login wsl

```powershell

# show WLS distributes
wsl -l

# login WSL defaut distribute
wsl 

# or login figure out distribute
# wsl -d Ubuntu-22.04

```

### password for root.

```bash

# root is no password when you install WSL
# It differen from normal install Linux, that must be setting password for root when you was installing Linux.

sudo passwd root

```

### update source of apt

```bash

# you can use `root` user or normal user with `sudo`.

# reffence: https://mirrors.tuna.tsinghua.edu.cn/help/debian/

sudo apt install apt-transport-https ca-certificates

# backup apt source.list
cp /etc/apt/source.list /etc/apt/source.list.bak

```

### editor surce.list

```bash
vi /etc/apt/source.list
```

in source.list

```txt
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

# deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
# # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware

deb https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
# deb-src https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
```

### apt update

```bash
apt update
apt upgrade && apt autoremove
```
## [CUDA](https://docs.nvidia.com/cuda/wsl-user-guide/index.html)

lookup: https://docs.nvidia.com/cuda/wsl-user-guide/index.html

### Install NVIDIA Driver for GPU Support

Install NVIDIA GeForce Game Ready or NVIDIA RTX Quadro Windows 11 display driver on your system with a compatible GeForce or NVIDIA RTX/Quadro card from https://www.nvidia.com/Download/index.aspx. Refer to the system requirements in the Appendix.)

**Note** : This is the only driver you need to install. Do not install any Linux display driver in WSL.


### CUDA Support for WSL 2

First, remove the old GPG key:

```bash
sudo apt-key del 7fa2af80
```

> * Option 1: Installation of Linux x86 CUDA Toolkit using WSL-Ubuntu Package - **Recommended**
> 
> > download link: "https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_network"
> >
> > The CUDA WSL-Ubuntu local installer does not contain the NVIDIA Linux GPU driver, so by following the steps on the [CUDA download page](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_network) for WSL-Ubuntu, you will be able to get just the CUDA toolkit installed on WSL.
> 
> * Option 2: Installation of Linux x86 CUDA Toolkit using Meta Package
> 
> > If you installed the toolkit using the WSL-Ubuntu package, please skip this section. Meta packages do not contain the driver, so by following the steps on the download page for Ubuntu, you will be able to get just the CUDA toolkit installed on WSL.
> >
> > The installation instructions for the CUDA Toolkit can be found in the CUDA Toolkit download page for each installer. But DO NOT choose the “cuda”, “cuda-12-x”, or “cuda-drivers” meta-packages under WSL 2 as these packages will result in an attempt to install the Linux NVIDIA driver under WSL 2. Install the cuda-toolkit-12-x metapackage only.
> >
> > You can also install other components of the toolkit by choosing the right meta-package.

### set env for CUDA in WSL2

check out nvidia driver version

```powershell
# check your nvidia driver version in powershell.
nvidia-smi

```

append to your `~/.bashrc` file

```bash
# ~/.bashrc
# reference: https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html

export PATH=/usr/local/cuda-12.2/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

```

### install cuDUU

download link: https://developer.nvidia.com/rdp/cudnn-archive

you should setup in NVIDIA when your download archive


```bash
tar -xzf ./cudnn-linux-x86_64-8.9.3.28_cuda12-archive.tar.xz

# option:
# mv ./cudnn-linux-x86_64-8.9.3.28_cuda12-archive /opt/cudnn

```

**notice** `/usr/local/cuda-<version>`
* my driver and path is 12.2

```bash
# reference: https://github.com/zihan987/wsl2-config

# sudo cp cuda/include/cudnn*.h /usr/local/cuda-<version>/include
sudo cp cuda/include/cudnn*.h /usr/local/cuda-12.2/include

sudo cp cuda/lib64/libcudnn* /usr/local/cuda-12.2/lib64
sudo chmod a+r /usr/local/cuda-12.2/include/cudnn.h 
sudo chmod a+r /usr/local/cuda-12.2/lib64/libcudnn*
```

## install Anaconda

https://learn.microsoft.com/en-us/windows/wsl/tutorials/gpu-compute

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

# reference

* https://learn.microsoft.com/en-us/windows/wsl
* https://developer.nvidia.com
* https://github.com/zihan987/wsl2-config
