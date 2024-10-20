#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

RANDOM_NUMBER=$((1 + $RANDOM % 1000))
NUMBER_GUESSES=0
echo $RANDOM_NUMBER
echo -e "\nEnter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users where username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  
else
   GAMES_PLAYED=$($PSQL "SELECT count(*) as games_played from games GROUP BY games.user_id HAVING user_id=$USER_ID")
   BEST_GAME=$($PSQL "SELECT guesses FROM games WHERE user_id=$USER_ID")
   echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


NUMBER_OF_GUESSES=1
echo -e "\nGuess the secret number between 1 and 1000:"
read USER_INPUT

until [[ $USER_INPUT =~ ^[0-9]+$ ]]
do
echo -e "\nThat is not an integer, guess again:"
read USER_INPUT
done

while [[ $USER_INPUT != $RANDOM_NUMBER ]]
do
  if [[ $USER_INPUT > $RANDOM_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  else
    echo -e "\nIt's higher than that, guess again:"
  fi
  ((NUMBER_OF_GUESSES++))
  read USER_INPUT
done

INSERT_GAME=$($PSQL "INSERT INTO GAMES(user_id, guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES)")
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
