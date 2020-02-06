


dator()
{
    date -R;
}

awkcliptor()
{
    awk -e 'BEGIN{ RS="^$" } {gsub(/^[\n\t ]*|[\n\t ]*$/,"");print ;exit}'  "$1"  ;

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
    while read -d'^' field
    do
	#echo "$field"

	# trim and clip field of spaces and new lines in start and end
	echo $field
	cfield="$(awkcliptor <<EOF
$field
EOF
)"
	echo k
	# echo clipped field for debugging
	echo "--55--"
	echo "$cfield"
	read hhh ;<&0

	# make the name of the file
	name=`shator "$cfield"`.crd

	# echo "$cfield" > "`shator $cfield`"

	# add the creation date and overwrite the file if exist
	echo  'd.created: '`dator` > $name
	echo   '---' >> $name
	# add the field
	echo "$cfield" >> $name
	

    done < "$1"
}


nonce ()
{
    # check for needle file and touch it if not found.
    [ ! -f needle ] && echo '' > needle ;
    # read the contents of needle
    read NEEDLE_STRING < needle
    for i in *.crd
    do
	#echo $i
	if
	    [[ "$i" > $NEEDLE_STRING ]]
	then
	    echo -e "\e[31m----------\e[00m"
	    cat $i;
	    read REPLY;
	    echo "$i" > needle
	fi
    done 
    
}
