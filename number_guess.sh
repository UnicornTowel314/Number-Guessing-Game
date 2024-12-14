#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RAND_NUM=$(( $RANDOM % 1000 + 1 ))
NUM_GUESS=0

echo "Enter your username:"
read USERNAME

PLAYER_ID=$($PSQL "SELECT player_id FROM player_stats WHERE username = '$USERNAME")

if [[ -z $PLAYER_ID ]]
then
  # insert player into table
  INSERT_PLAYER_RESULT=$($PSQL "INSERT INTO player_stats(username) VALUES('$USERNAME')")
  # welcome player
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # query table
  PLAYER=$($PSQL "SELECT username, games_played, best_game FROM player_stats WHERE player_id = $PLAYER_ID")
  # welcome player
  echo "$PLAYER" | while read USER BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS

if [[ $GUESS -gt $RAND_NUM ]]
then
  echo "It's lower than that, guess again:"
  read GUESS
  NUM_GUESS=$(( NUM_GUESS + 1 ))
elif [[ $GUESS -lt $RAND_NUM ]]
then
  echo "It's higher than that, guess again:"
  read GUESS
  NUM_GUESS=$(( NUM_GUESS + 1 ))
elif [[ $GUESS -eq $RAND_NUM ]]
then
  echo "You guessed it in $NUM_GUESS tries. The secret number was $RAND_NUM. Nice job!"
  # get best game stat
  
  # if fewest guesses
  # update best game stat
fi
