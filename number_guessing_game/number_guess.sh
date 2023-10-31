#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
TARGET=$(( $RANDOM % 1000 + 1 ))

echo Enter your username:
read USERNAME

INFO=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
if [[ ! -z $INFO ]]
then
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  NUM_GAMES=$($PSQL "SELECT numGames FROM users WHERE username='$USERNAME'")
  MIN_SCORE=$($PSQL "SELECT minScore FROM users WHERE username='$USERNAME'")
  echo -e "\nWelcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $MIN_SCORE guesses."
else
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  NUM_GAMES=$($PSQL "SELECT numGames FROM users WHERE username='$USERNAME'")
  MIN_SCORE=$($PSQL "SELECT minScore FROM users WHERE username='$USERNAME'")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS
NUM_GUESSES=1

test_guess() {
  if [[ ! $1 =~ [0-9]+ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
    test_guess $GUESS
  elif [[ $1 -lt $TARGET ]]
  then
    echo "It's higher than that, guess again:"
    read GUESS
    NUM_GUESSES=$(( $NUM_GUESSES+1 ))
    test_guess $GUESS
  elif [[ $1 -gt $TARGET ]]
  then 
    echo "It's lower than that, guess again:"
    read GUESS
    NUM_GUESSES=$(( $NUM_GUESSES+1 ))
    test_guess $GUESS
  fi
}
test_guess $GUESS

echo -e "\nYou guessed it in $NUM_GUESSES tries. The secret number was $TARGET. Nice job!"

UPDATE_GAMES=$($PSQL "UPDATE users SET numgames=$(( $NUM_GAMES+1 )) WHERE user_id=$USER_ID")

if [[ -z $MIN_SCORE || $NUM_GUESSES -lt $MIN_SCORE ]]
then
  UPDATE_SCORE=$($PSQL "UPDATE users SET minscore=$NUM_GUESSES WHERE user_id=$USER_ID")
fi


