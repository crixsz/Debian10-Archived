# Debian 10 Archived ISO

This repository provides resources for working with the archived Debian 10 (Buster) cloud image and configuring APT to use the official archived repositories.

## Download the Debian 10 Cloud Image

Download the latest Debian 10 (Buster) generic cloud image (QCOW2 format) from the official archive:

```
https://cdimage.debian.org/cdimage/cloud/buster/latest/debian-10-genericcloud-amd64.qcow2
```

## Setting Up Archived APT Sources

After launching your Debian 10 instance, run the provided `setup-apt.sh` script to update your `sources.list` to use the archived Debian repositories. This ensures you can continue to install and update packages even though Debian 10 is no longer actively maintained.

Run the following one-liner to download, make executable, and run the `setup-apt.sh` script as root:  

```
wget https://github.com/crixsz/Debian10-Archived/setup-apt.sh && chmod +x setup-apt.sh && ./setup-apt.sh
```


---

**Note:** This setup is intended for legacy systems and should not be used for new deployments. For more information, see the [Debian Archive documentation](https://wiki.debian.org/DebianRepository/Archive).
