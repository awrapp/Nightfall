#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

## awrapp >>
### PlasmaZones for excellent window management
dnf5 -y copr enable fuddlesworth/PlasmaZones
dnf5 -y install plasmazones
dnf5 -y copr disable fuddlesworth/PlasmaZones

### Klassy for a better default theme
dnf5 -y config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:paulmcauley/Fedora_43/home:paulmcauley.repo
dnf5 -y install klassy
dnf5 -y config-manager setopt https://download.opensuse.org/repositories/home:paulmcauley/Fedora_43/home:paulmcauley.repo.enabled=0

#### Example for enabling a System Unit File

systemctl enable podman.socket

## awrapp >>
#systemctl enable
