#! /bin/bash

# display info
# a tool to manage users
# usage info

what_do_you_want_to_do(){
clear
echo "what do you want to do?"

cat <<EOF
| current info | A |
| modify       | B |

EOF
#read user_input
read -n 1 user_input # with the -n key you do not have to hit return key

case $user_input in
    [Aa])
	#       Statement(s) to be executed if pattern1 matches	
#	echo $(1:commnd)
	current_info
	;;
    [Bb])
	modify
	;;
    pattern3)
	#       Statement(s) to be executed if pattern3 matches
	;;
    *)
	#      Default condition to be executed
	;;
esac




}



modify(){
clear
echo "############# MODIFY SYSTEM ##################"
echo "what do you want to do?"
cat <<EOF
| add users                | 1 |
| change group             | 2 |
| remove user from a group | 3 |
| add group                | 4 |
| add user to group        | 5 |
| send message to user     | 6 |
| send mail to user        |   |
| back to main menu        | b |

EOF
# read user_input
read -n 1 user_input # with the -n key you do not have to hit the return key

case $user_input in
    1)
	#       Statement(s) to be executed if pattern1 matches	
#	echo $(1:commnd)
#	current_info
	;;
    [Bb])
	what_do_you_want_to_do
	;;
    # pattern3)
    # 	#       Statement(s) to be executed if pattern3 matches
    # 	;;
    *)
	#      Default condition to be executed
	;;
esac



}

current_info(){
clear
echo "############### CURRENT INFORMATION #############"
cat <<EOF
| list groups                                | 1 |
| list groups a user is in                   | 2 |
| how much is a user using of the disk space | 3 |
| back to main menu                          | b |

EOF
# read user_input
read -n 1 user_input # with the -n key you do not have to hit the return key

case $user_input in
    1)
	#       Statement(s) to be executed if pattern1 matches	
#	echo $(1:commnd)
#	current_info
	;;
    [Bb])
	what_do_you_want_to_do
	;;
    # pattern3)
    # 	#       Statement(s) to be executed if pattern3 matches
    # 	;;
    *)
	#      Default condition to be executed
	;;
esac

#case esac
}

what_do_you_want_to_do
