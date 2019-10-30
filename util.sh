
say(){
    Black='\033[0;30m'
    DarkGray='\033[1;30m'
    Red='\033[0;31m'
    LightRed='\033[1;31m'
    Green='\033[0;32m'
    LightGreen='\033[1;32m'
    BrownOrange='\033[0;33m'
    Yellow='\033[1;33m'
    Blue='\033[0;34m'
    LightBlue='\033[1;34m'
    Purple='\033[0;35m'
    LightPurple='\033[1;35m'
    Cyan='\033[0;36m'
    LightCyan='\033[1;36m'
    LightGray='\033[0;37m'
    White='\033[1;37m'
    RED='\033[0;31m'
    NC='\033[0m'

    echo -e "${Green}${1}${NC}"
}

saydir(){
    dir=$1
    if [ -z "$dir" ]
    then
        dir=$(basename "$PWD")
    fi
    say $dir
}

debug_profile(){
    fswatch -0 ~/.bash_profile  | while read -d "" event
    do
        resrc
        echo \n\n
        $@
    done
}
