function bam() {
    if [ -n $1 ]; then
        ENV=$1
    else
        ENV='prod'
    fi

    cd ~/programming/account-manager
    export ACCOUNTMANAGER_ENV=$ENV
    activate
}
