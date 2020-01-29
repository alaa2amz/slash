dator(){
    date -R; }

awkcliptor(){
    echo "$1" |awk -e 'BEGIN{ RS="^$" } {gsub(/^[\n\t ]*|[\n\t ]*$/,"");print ;exit}'  ; } 

shator(){
     sha1sum <<<"$1" |tr -d \ \-  ; }

cartor(){
    IFS='^'
    for field in `cat $1`
    do
	echo "$field"
	cfield="`awkcliptor $field`"
	echo $cfield
	name="`shator $cfield`"
	#echo "$cfield" > "`shator $cfield`"
	echo 'd.created: '`dator` > $name
	echo "$cfield" >> $name
	

    done
}
