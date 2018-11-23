#! /bin/bash

# create array one
hash_generating_programs=(shasum sha1sum sha256sum sha512sum sha224sum sha384sum md5sum)
# create array two
input_file="/etc/shadow"

while read line
do
    hashes_from_the_shadow_file+=($(echo $line |grep -v "[!*]"| awk -F":" '{print $2}'))

done <$input_file


prompt_user_for_plaintext_password(){

    echo "Enter the plaintext password"
    read user_supplied_plaintext_password
    echo
    echo "Thanks!"
    
    crunch_hashes $user_supplied_plaintext_password $hash_generating_programs $hashes_from_the_shadow_file

}

crunch_hashes(){
    user_supplied_plaintext_password=$1
    hash_generating_programs=$2
    hashes_from_the_shadow_file=$3

    
counter=0

for a in ${hash_generating_programs[@]}
do
    for b in ${hashes_from_the_shadow_file[@]}
    do
	xx="echo $user_supplied_plaintext_password | $a"
	generated_hash=$(eval $xx)

	echo "$counter"
	((counter++))
	echo "------$a---------"
	echo "------ $b --------"

	if [ "$generated_hash" = "$b" ]
	then
	    echo "inside final loop: match was found"
	    echo "$user_supplied_plaintext_password matched $b"
	    echo "The hashing program used was $a"
	     echo "#######################################################################################"
	    
	else

	     :
	   
	fi 
    done 
    
done
}

prompt_user_for_plaintext_password

# why is this relevant?
# if done in two seperate machines and if same password were used, the hash should not match due to salting magic.

# no idea what kind of hashing is done on the passwords, the length of the strings dont match up

# as expected this would just fail
