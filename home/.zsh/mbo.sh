function mbo() {
    if [ -n $1 ]; then
        ENV=$1
    else
        ENV='prod'
    fi

    cd ~/programming/mijnbaopt
    export MIJNBAOPT_ENV=$ENV
    export MIJNBAOPT_DIR='/home/jaapz/programming/mijnbaopt'
    export MIJNBAOPT_VENV='/home/jaapz/programming/mijnbaopt/.env'
    activate
}
