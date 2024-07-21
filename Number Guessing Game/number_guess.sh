#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER

# check if the username exist in the datbasebase
USERNAME=$($PSQL "SELECT username FROM users WHERE username = '$USER'")
if [[ -z $USERNAME ]]
then
# user is not found
  echo "Welcome, $USER! It looks like this is your first time here."
  # add user to database
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USER')")
else
# user is found
  GAME_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN users USING(user_id) WHERE username = '$USER'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games LEFT JOIN users USING(user_id) WHERE username = '$USER'")
  echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate random number bwtween 1 and 1000
RANDOM_NUMBER=$(( ($RANDOM % 1000) + 1 ))

# default value for guess count
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

# loop to prompt users until the guess is correct
until [[ $GUESS == $RANDOM_NUMBER ]]
do

  # check if the guess is number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read GUESS
      ((GUESS_COUNT++))
  else
    # check if it's lower of greater
    if [[ $GUESS < $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        read GUESS
        ((GUESS_COUNT++))
      else
        echo "It's lower than that, guess again:"
        read GUESS
        ((GUESS_COUNT++))
    fi
  fi

done
((GUESS_COUNT++))

echo "You guessed it in $GUESS_COUNT tries. The secret number was $GUESS. Nice job!"

# get user_id
USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE username = '$USER'")
# add game result to games table
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($GUESS_COUNT, $USER_ID_RESULT)")