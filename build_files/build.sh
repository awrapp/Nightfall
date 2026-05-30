#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y haruna inkscape krita gimp godot

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

## awrapp >>
### Change shell to fish and install starship
#dnf5 install -y fish chsh

### PlasmaZones for excellent window management
dnf5 -y copr enable fuddlesworth/PlasmaZones
dnf5 -y install plasmazones
dnf5 -y copr disable fuddlesworth/PlasmaZones

### Klassy for a better default theme
dnf5 -y config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:paulmcauley/Fedora_43/home:paulmcauley.repo
dnf5 -y install klassy
#dnf5 -y config-manager setopt https://download.opensuse.org/repositories/home:paulmcauley/Fedora_43/home:paulmcauley.repo.enabled=0

### KDE material you for a better default theme
dnf5 -y config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:luisbocanegra/Fedora_43/home:luisbocanegra.repo
dnf5 -y install kde-material-you-colors

#### Example for enabling a System Unit File

systemctl enable podman.socket

## awrapp >>
#systemctl enable
