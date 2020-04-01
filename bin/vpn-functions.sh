vpn_connect() {
    username=$(keyring get oncor username)
    pin=$(keyring get oncor pin)
    token=$1
    pam=$(keyring get oncor pam)

    credentials=$(cat <<EOM
${username}
${pin}${token}
${pam}
EOM
)

    echo "${credentials}" | nmcli connection up Oncor --ask
}

vpn_disconnect() {
    nmcli connection down Oncor
}
