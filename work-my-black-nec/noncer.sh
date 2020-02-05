


dator()
{
    date -R;
}

awkcliptor()
{
    awk -e 'BEGIN{ RS="^$" } {gsub(/^[\n\t ]*|[\n\t ]*$/,"");print ;exit}' "$1"  ;
} 

shator()
{
    sha1sum <<<"$1" |tr -d \ \-  ;
}

cartor()
{
    #set interfield separator to delimtter ^
    IFS='^'

    # loop over the fields of ^ separated of file given
    # as argument
    for field in `cat $1`
    do
	echo "$field"
	cfield="`awkcliptor $field`"
	echo $cfield
	name="`shator $cfield`".crd
	#echo "$cfield" > "`shator $cfield`"
	echo 'd.created: '`dator` > $name
	echo "$cfield" >> $name
	

    done
}


nonce ()
{
    # check for needle file and touch it if not found.
    [ ! -f needle ] && touch needle ;
    # read the contents of needle
    read NEEDLE_STRING ; < needle
    for i in *.crd
    do
	if
	    [[ "$i" > NEEDLE_STRING ]]
	then
	    cat $i;
	    read REPLY;
	    echo "$i" > needle
	fi
    done
    
}
