#! /bin/bash
#Script for a number guessing game
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#number to be guessed
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
#number of tries it takes to guess
USER_TRIES=0
USERNAME=""

SAVE_GAME(){
  #saving game info to db
  INSERT_GAME_RESULT="$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = LEAST(best_game, $USER_TRIES)
    WHERE username = '$USERNAME'")"
}

GAME_GUESSES(){
  USER_GUESS=$1
  #add 1 per try
  USER_TRIES=$(( $USER_TRIES + 1 ))
  #user guess less than secret number
  if [[ $USER_GUESS -lt $SECRET_NUMBER ]]
  then
    GAME_START "It's higher than that, guess again:"
  #user guess greater than secret number
  elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
  then
    GAME_START "It's lower than that, guess again:"
  #user guess equals secret number
  elif [[ $USER_GUESS -eq $SECRET_NUMBER ]]
  then
  #feedback
  echo You guessed it in $USER_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!
  #save
  SAVE_GAME
  fi
}

GAME_START(){
  if [[ $1 ]]
  then
  #show passed message
  echo $1
  else
  echo Guess the secret number between 1 and 1000:
  fi
  read USER_GUESS
  #if int
  if [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then
  GAME_GUESSES $USER_GUESS
  else
  #not int
  GAME_START "That is not an integer, guess again:"
  fi
}

GAME_INIT(){
echo -e "\n~~~ Number guessing game ~~~\n"
echo "Enter your username:"
read USERNAME
#check username length
if [[ ${#USERNAME} -lt 22 ]]
then 
GET_USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
  #if user not found
  if [[ -z $GET_USERNAME ]]
    then
      #new user
        echo Welcome, $USERNAME! It looks like this is your first time here.
      #insert user
        INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username, games_played) VALUES ('$USERNAME', 0)")
      else
      #existent user
        USER_GAMES=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")
        echo $USER_GAMES | while IFS=" | " read GAMES_PLAYED BEST_GAME
        do
        echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
        done
   fi
   GAME_START
   else
   echo Make sure your username is 22 characters or less.
  fi
}

GAME_INIT