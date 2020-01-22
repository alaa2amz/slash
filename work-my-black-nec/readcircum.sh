while read -d'^' g  ; do echo $g; read <&1 ; done < word.log 
