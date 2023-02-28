#!/usr/bin/env bash
# Truly marginal secrets management

readonly enc_files=".env configuration.yml"

case $1 in
encrypt)
    read -p "Passphrase (1/2): " -s p; echo
    read -p "Confirm    (2/2): " -s q; echo

    if [[ $p != $q ]]; then
        echo "Passphrases do not match." >&2
        exit 1
    fi

    for f in $enc_files; do
        echo "Encrypting $f to $f.sc"
        echo $p | scrypt enc -P -M $((2**28)) -t 1 $f $f.sc
    done
    ;;
decrypt)
    read -p "Passphrase: " -s p; echo

    for f in $enc_files; do
        echo "Decrypting $f.sc to $f"
        echo $p | scrypt dec -P $f.sc $f
    done
    ;;
esac

