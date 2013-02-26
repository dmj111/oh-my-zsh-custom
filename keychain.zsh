# Use keychain, if it is available.


[[ -f $(which keychain 2> /dev/null) ]] && \
    keychain --nogui --quiet id_rsa

[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && \
    source $HOME/.keychain/$HOSTNAME-sh

