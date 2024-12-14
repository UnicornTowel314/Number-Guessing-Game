#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RAND_NUM=$(( $RANDOM % 1000 + 1 ))

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
  # welcome player
fi
