#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RAND_NUM=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME
