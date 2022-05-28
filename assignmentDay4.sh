#!/bash/bash
echo "Hello, what is your name?"
read name
echo "What is your email?"
read email
echo "What is your username?"
read username
echo "what is your password?"
read password

echo "$name,$email,$username,$password" >> data.csv
