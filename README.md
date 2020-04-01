# Overview
Simple utility to to establish and terminate an OpenConnect VPN connection from the command line.

Sensitive information is stored in GNOME Keyring.

## Rationale
The Network Manager OpenConnect GNOME `network-manager-openconnect-gnome` plug-in does not support providing a username,
symmetric password (PAM) and a second factory password (PIN+Token).

Similarly it is currently unclear how to properly set up a Network Manager OpenConnect VPN connection profile to support
these.

# Setup
## OpenConnect Software
### Fedora Setup
```bash
sudo dnf install -y NetworkManager-openconnect NetworkManager-openconnect-gnome
```

### RHEL 7 / 8 Setup
```bash
sudo yum install -y epel-release
sudo yum install -y NetworkManager-openconnect NetworkManager-openconnect-gnome
```

### Ubuntu Setup
```bash
sudo apt install -y network-manager-openconnect network-manager-openconnect-gnome
```

## Create Network Manager OpenConnect VPN Profile
```bash
sudo install -o root -g root -m 0600 Oncor.nmconnection /etc/NetworkManager/system-connections/
```

## Escrow Sensitive Information to Key Ring
```bash
keyring set oncor username
keyring set oncor pam
keyring set oncor pin
```

# Establish VPN Connection
```bash
./bin/vpn connect
```

# Terminate VPN Connection
```bash
./bin/vpn disconnect
```

# Clean up
When you no longer need this:
```bash
sudo nmcli connection delete Oncor
keyring del oncor username
keyring del oncor pam
keyring del oncor pin
```

# References
* GNOME VPN Properties for OpenConnect: /usr/share/gnome-vpn-properties/openconnect/nm-openconnect-dialog.ui
