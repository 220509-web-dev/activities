#!/bin/bash

if [ -z $1 ]; then
# -z string: True if the length of string is zero.
  echo "Invalid usage, you must provide an username!"
  echo "Example: $0 SJones"
  exit 1
fi

if [ $(./is-this-thing-on.sh Sigg-db) -eq 0 ]; then
  echo "Cannot connect to database. Check to see if it is running."
  exit 1
fi

query="select * from tryagain4.app_users where username = '$1';"
        ##  -   In this line, query has been made a variable, and used in the echo below

echo "$query" | docker exec -i Sigg-db psql -U postgres | grep $1 | wc -l


##  RUN THIS COMMAND FROM MY DIRECTORY:
# echo "select * from tryagain4.app_users where username = '$1';" | docker exec -i Sigg-db psql -U postgres
    # ^^^^ This will return a blank table
        #   id | first_name | last_name | email | username | password 
        #   ----+------------+-----------+-------+----------+----------
        #   (0 rows)

# echo "select * from tryagain4.app_users where username = 'SJones';" | docker exec -i Sigg-db psql -U postgres
    # ^^^^ This will return user info associated with said username
        #    id | first_name | last_name |       email        | username | password 
        #   ----+------------+-----------+--------------------+----------+----------
        #     8 | Sara       | Jones     | SJones@cleanup.com | SJones   | Qwerty12
        #   (1 row)

# echo "select * from tryagain4.app_users where username = 'SJones';" | docker exec -i Sigg-db psql -U postgres | grep 'SJones'
    # ^^^^ This will clean it up even more
        #   8 | Sara       | Jones     | SJones@cleanup.com | SJones   | Qwerty12

# echo "select * from tryagain4.app_users where username = 'SJones';" | docker exec -i Sigg-db psql -U postgres | grep 'SJones' | wc -l
    # ^^^^ This line will show how many lines include this same email. If it shows "0", then it's available, anything other than "0", then it's not available