# You can use any debian based image you want
FROM mcr.microsoft.com/vscode/devcontainers/base:0-bullseye

# Install openvpn client
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update \
    && apt-get -y install --no-install-recommends openvpn \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/library-scripts \
    #
    # Remove the OPENVPN_CONFIG variable since we don't neeed it after is written to a file
    && echo 'OPENVPN_CONFIG=""' >> /etc/environment \
    && echo "unset OPENVPN_CONFIG" | tee -a /etc/bash.bashrc > /etc/profile.d/999-unset-openvpn-config.sh \
    && if [ -d "/etc/zsh" ]; then echo "unset OPENVPN_CONFIG" >> /etc/zsh/zshenv; fi \
    && base=https://api.github.com/repos/EdJoPaTo/website-stalker/releases/latest \
    && url=$(curl $base | jq --raw-output '.assets[] | select(.name | test("x86_64-unknown-linux-gnu.tar.gz")) | .browser_download_url') \
    && wget -q -O - "$url" | sudo tar xz --directory=/usr/local/bin website-stalker


