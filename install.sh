#!/bin/sh
# This is a comment!
echo Hello From Installer

add_a_user()
{
  USER=$1
  echo "Adding user $USER ..."
}

###
# Main body of script starts here
###
echo "Start of script..."
add_a_user bob
add_a_user jhon
echo "End of script..."
