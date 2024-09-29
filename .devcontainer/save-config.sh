#!/usr/bin/env bash
set -e

# Switch to the .devcontainer folder
cd "$( dirname "${BASH_SOURCE[0]}" )"

# Create a temporary directory
mkdir -p openvpn-tmp
cd openvpn-tmp

# Save the configuration from the secret if it is present
if [ ! -z "${OPENVPN_CONFIG}" ]; then 
    echo "${OPENVPN_CONFIG}" > vpnconfig.ovpn
fi

if [ ! -z "${OPENVPN_USER}" ] && [ ! -z "${OPENVPN_PASS}" ]; then 
    echo "${OPENVPN_USER}" > pass.txt
    echo "${OPENVPN_PASS}" >> pass.txt
    chmod 0400 pass.txt
fi


