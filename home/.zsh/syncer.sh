function syncer() {
    if [ -n $1 ]; then
        ENV=$1
    else
        ENV='prod'
    fi

    cd ~/programming/syncer
    export SYNCER_ENV=$ENV
    activate
    pynt setup
}
