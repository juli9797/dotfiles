#/bin/bash
tags=$(herbstclient tag_status|sed -e 's/[[:digit:]]//g')
res=""
for i in $tags
do
    :
    res=$res"|"
    case $i in
        ".")
           res=$res" " 
            ;;
        ":")
           res=$res"_" 
            ;;
        "+")
           res=$res"_" 
            ;;
        "#")
           res=$res"X" 
            ;;
        "-")
           res=$res"X" 
            ;;
        "%")
           res=$res"X" 
            ;;
        "!")
           res=$res"!" 
            ;;
        "*")
            ;;
    esac

done
res=$res"|"
echo $res;
