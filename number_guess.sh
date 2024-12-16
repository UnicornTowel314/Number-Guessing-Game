#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GAME() {
  echo "Enter your username:"
  read USERNAME

  PLAYER=$($PSQL "SELECT username FROM player_stats WHERE username = '$USERNAME'")
  if [[ -z $PLAYER ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_PLAYER_RESULT=$($PSQL "INSERT INTO player_stats(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM player_stats WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM player_stats WHERE username = '$USERNAME'")
    echo -e "\nWelcome back, $PLAYER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  RAND_NUM=$(( $RANDOM % 1000 + 1 ))
  COUNTER=0
  GUESSES=0

  echo -e "\nGuess the secret number between 1 and 1000:"
  read GUESS
  ((GUESSES++))

  while [[ $GUESS != $RAND_NUM ]]
  do
    if [[ $GUESS != [0-9]* ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      read GUESS
      ((GUESSES++))
    elif [[ $GUESS < $RAND_NUM ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      read GUESS
      ((GUESSES++))
    elif [[ $GUESS > $RAND_NUM ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      read GUESS
      ((GUESSES++))
    fi
  done

  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE player_stats SET games_played = games_played + 1 WHERE username = '$USERNAME'")
  if [[ $BEST_GAME == 0 ]] || [[ $BEST_GAME > $GUESSES ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE player_stats SET best_game = $GUESSES WHERE username = '$USERNAME'")
  fi

  echo -e "\nYou guessed it in $GUESSES tries. The secret number was $RAND_NUM. Nice job!"
}

GAME
