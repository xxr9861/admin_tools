#! /bin/bash

# create array one
hash_generating_programs=(shasum sha1sum sha256sum sha512sum sha224sum sha384sum md5sum)
# create array two
# hashes_from_the_shadow_file=()
#input_file="/etc/shadow"
input_file="./shadow"

#get_hashes(){
while read line
do
    hashes_from_the_shadow_file+=($(echo $line |grep -v "[!*]"| awk -F":" '{print $2}'))
#    hashes_from_the_shadow_file+=$(echo -n " ")
done <$input_file

#prompt_user_for_plaintext_password $hashes_from_the_shadow_file

#} <$input_file

# for loop of array one, iterate though all the items of array one
# inside this loop, there is a second loop. for loop though all the items of array two

# so for item1 of arrayone- all items of arraytwo
# for item2 of arrayone - all items of arraytwo
# and so on.

# arrayone - hash program list like md5sum, shasum and so on
# arraytwo - list of shadow hashes from the shadow file

# hash_generating_program input_plaintext_password hashes_from_shadow_file

# if match, then exit loop echo out the matched plaintext and corresponding hash and also the hash_program used

prompt_user_for_plaintext_password(){

    echo "Enter the plaintext password"
    read user_supplied_plaintext_password
    echo
    echo "Thanks!"
    
#    crunch_hashes $user_supplied_plaintext_password #$hash_generating_programs $hashes_from_the_shadow_file
    crunch_hashes $user_supplied_plaintext_password $hash_generating_programs $hashes_from_the_shadow_file

}

crunch_hashes(){
    user_supplied_plaintext_password=$1
    hash_generating_programs=$2
    hashes_from_the_shadow_file=$3
#     echo "user_supplied_plaintext_password is $user_supplied_plaintext_password"
#     echo "hash_generating_programs is $hash_generating_programs"
#     echo "hashes_from_the_shadow_file is $hashes_from_the_shadow_file"
# echo "hash generating programs"
#     for i in "${hash_generating_programs[@]}"
#     do
# 	echo "$i"
#     done
echo "hashes_from_the_shadow_file are"
    for i in "${hashes_from_the_shadow_file[@]}"
    do
	echo "qqqqqqqqqqqqqqqqq"
	echo "$i"
	echo "qqqqqqqqqqqqqqqqq"

    done  # why does the loop terminate

echo "user supplied plaintext is $user_supplied_plaintext_password"    # test

counter=0

for a in ${hash_generating_programs[@]}
do
#    echo "inside final loop: the hash generating program is $a" # test
    for b in ${hashes_from_the_shadow_file[@]}
    do
	#	echo "inside final loop: the hashes from the shadow file is $j" # test
#	xx="/usr/bin/$a $user_supplied_plaintext_password" # ?????????????????????
	xx="echo $user_supplied_plaintext_password | $a"
#	eval $xx
	generated_hash=$(eval $xx)
#	generated_hash=$("$a $user_supplied_plaintext_password")
       #	echo "inside final loop: $generated_hash" #test
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
	    # echo "inside final loop: match was not found found"
	   #  echo "$user_supplied_plaintext_password matched $b"
	   #  echo "The hashing program used was $a"
	   # echo "#######################################################################################"
	   
	fi 
    done # inside loop is not working
    
done
}

prompt_user_for_plaintext_password
# why is this relevant?
# if done in two seperate machines and if same password were used, the hash should not match due to salting magic.

