#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RAND_NUM=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

PLAYER_ID=$($PSQL "SELECT player_id FROM player_stats WHERE username = '$USERNAME'")
if [[ -z $PLAYER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  PLAYER=$($PSQL "SELECT username FROM player_stats WHERE player_id = $PLAYER_ID")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM player_stats WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM player_stats WHERE username = '$USERNAME'")
  echo "Welcome back, $PLAYER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
