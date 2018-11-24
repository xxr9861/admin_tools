#! /bin/bash

# rotating through an array list

array=(one two three four five six seven eight nine ten eleven twelve)
current_selection=1


display_unit(){
    current_selection="$@"
    clear
    echo "testing............"
    echo "you selected  =====>>         ${array[$current_selection]}"    

    display

}


display(){
echo "the elements of the array are: "
for i in ${array[@]}
do
    echo -n "$i "
done
echo
echo
echo "currently selected element is ${array[$current_selection]}"
echo
echo

echo "press f to go ahead in index"
echo "press b to go behind in index"
#read user_input
read -n 1 user_input # with the use of -n switch you do not have to hit the return key 

case $user_input in
    [bB])
	#       Statement(s) to be executed if pattern1 matches	
	((current_selection--))
	display_unit $current_selection 

	;;
    [fF])
	((current_selection++))
	display_unit $current_selection

	;;
    pattern3)
	#       Statement(s) to be executed if pattern3 matches
	;;
    *)
	#      Default condition to be executed
	;;
esac


}
display

