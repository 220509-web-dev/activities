#!/bin/bash

## THIS IS THE MOCKDATA SCRIPT FOR MY WEEK 2 TABLE/(Tryagain4 SCHEMA) ASSIGNMENT tryagain3-table-creation.sql
# Task: Create a script file that takes in required user information and inserts into a table that esist in your directory

# Syntaxl rules:
#   -   variable assignments should not include any spaces between the variable name, the = sign, or the value
#   -   test constructs [], must have spaces separating their contents from the brackets themselves
#   -   subscript $(), used to execute a command and use its output for something (e.g. store it in a variable)

isDatabaseOn=$(./is-this-thing-on.sh Sigg-db)
if [ $isDatabaseOn -eq 0 ]; then
  echo "Cannot connect to database. Check to see if it is running."
  echo "Cancelling registration."
  exit 1
fi
    #   -p prompt: Display prompt on standard error, without a trailing newline, before attempting to read any input.
    #       The prompt is displayed only if input is coming from a terminal.
    #   -r: Backslash does not act as an escape character. The backslash is considered to be part of the line.
    #      In particular, a backslash-newline pair may not be used as a line continuation.
echo "Please provide some basic information to complete your registration"
read -p "Id: " id
read -p "First name: " first
read -p "Last name: " last
read -p "Email address: " email
read -p "Username: " username
read -r -p "Password: " password

            # Check to see if the provided email is already taken in the database.
eamilTaken=$(./is-email-available.sh $email)

            # If it is, have the user provide a different email (loop until an available one is given.)
                    ## (-ne): "n" is the <Word Designator>, "e" is the <Modifier>
                    ##  n      The nth word.    |   e      Remove all but the trailing suffix.q
while [ $emailTaken -ne 0 ]; do 
  echo "A user is already registered with that email, please enter another or type \q to cancel"
  read -r -p "Email address: " email

  if [ $email = "\q" ]; then
    echo  "Cancelling registration"
    exit 0
  else
    eamilTaken=$(./is-email-available.sh $email)
  fi

done

            # Check to see if the provided username is already taken in the database.
usrnameTaken=$(./is-username-available.sh $username)

            # If it is, have the user provide a different username (loop until an available one is given.)
while [ $usernameTaken -ne 0 ]; do
  echo "A user is already registered with that username, please enter another"
  read -r -p "Uername: " username

  if [ $username = "\q" ]; then
    echo  "Cancelling registration"
    exit 0
  else
    usernameTaken=$(./is-username-available.sh $username)
  fi

done

insert="INSERT INTO tryagain4.app_users (id, first_name, last_name, email, username, password) VALUES ('$id','$first', '$last', '$eamil', '$username', '$password');"

echo $insert | docker exec -i Sigg-db psql -U postgres

## Connect to my container with: ./connect-to-db.sh Sigg-db postgre

## set search_path to tryagain4;

## select * from app_users;

## To INSERT DATA, us the following example:
## postgres=# insert into app_users (first_name, last_name, email, username, password)
##            values ('Briana','Manina','BrianaManin@fofo.com','BrianaMa','Briana00');

#### I AM GETTING THE FOLLOWING TWO ERRORS WHEN TESTING username & email  #####
                ####    ASK FOR HELP UNDERSTANDING !!!!     ####
  ## ./create-tryagain3-user.sh: line 35: [: -ne: unary operator expected ##
  ## ./create-tryagain3-user.sh: line 52: [: -ne: unary operator expected ##