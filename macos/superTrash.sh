# a trash, prevent dangerous option, like 'rm -rf *'

mv2trash()
{
    DATE="$( date +%m%d%H%M%S )"
    for file in $*
    do
        if [[ ! $file == -* ]];then
            mv $file ~/.trash/$DATE."$(basename $file)"
        fi
    done
}

lstrash()
{
    ls -alF ~/.trash
}

cleartrash()
{
    ls -al ~/.trash
    read -p "clear trash? [Y/n] " confirm
    [ $confirm == 'Y' ] || [ $confirm == 'y' ] && /bin/rm -rf ~/.trash/*
}

mv2backup()
{
    DATE="$( date +%m%d%H%M%S )"
    for file in $*
    do
        if [[ ! $file == -* ]];then
            cp -rf $file ~/.backup/$DATE."$(basename $file)"
        fi
    done
}

alias lt=lstrash
alias clt=cleartrash
alias rm=mv2trash
alias bac=mv2backup