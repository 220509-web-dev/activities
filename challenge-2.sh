#!/bin/bash
# Print welcome menu and display menu option
printf "Welcome to Words Gone Wild online poetry show!\nPlease select from the following options:\n"

echo "1) Register"
echo "2) Login"
echo "3) Exit"

# Get user menu selection and determine which option they picked
read selection
echo $selection

if [ $selection = "1" ]; then

  # Prompt the user for registration data nad print it out to data.csv
  echo "Please provide us with some basic information to complete our registration:"
  read -p "first name: " first
  read -p "last name: " last
  read -p "email address: " email
  read -p "username: " username
  read -p "password: " password

echo "$first,$last,$email,$username,$password" >> data2.csv

elif [ $selection = "2" ]; then

  # Prompt the user for credentials
  echo "Please provide us with some basic information to complete your registration:"
  read -p "username: " un
  read -p "password: " pw

  # Read each line of data2.csv and see if there are any records with matching credentials
  exec < data.csv
  read header
  while IFS="," read -r f l e u p; do
    echo "$f,$l,$e,$u,$p"
  done


elif [ $selection = "3" ]; then
  echo "Closing application"
  exit 0
else
  echo "Invalid selection!"
fi
