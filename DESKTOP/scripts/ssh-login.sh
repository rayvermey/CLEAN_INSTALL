TARGETPC+$1
ssh-keygen -t rsa # on both pc
ssh-copy-id $TARGETPC
ssh $TARGETPC # does not prompt from password anymore
