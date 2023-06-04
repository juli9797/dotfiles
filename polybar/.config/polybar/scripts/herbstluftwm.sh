#/bin/bash
tags=$(herbstclient tag_status|sed -e 's/[[:digit:]]//g')
res=""
num=0
client_count=$(herbstclient list_clients | wc -l)
for i in $tags
do
    :
    ((num=num+1))
    res=$res"|"
    case $i in
        ".")
           res=$res%{F#777}$num%{F-} 
            ;;
        ":")
           res=$res$num 
            ;;
        "+")
           res=$res%{F#00f}$num%{F-} 
            ;;
        "#")
           res=$res%{F#f8c}$num%{F-} 
            ;;
        "-")
           res=$res%{F#fff}$num%{F-} 
            ;;
        "%")
           res=$res%{F#f44}$num%{F-} 
            ;;
        "!")
           res=$res%{F#122}$num%{F-} 
            ;;
        "*")
            ;;
    esac

done
res=$res"|  "%{F#99F}$client_count%{F-}
echo $res;
