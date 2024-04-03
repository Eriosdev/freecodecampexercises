#!/bin/bash

if [[ $1 ]]
  then
    echo -e "\n$1"
fi

PSQL="psql --username=postgres --dbname=number_guess -t --no-align -c"
# Generar un número aleatorio entre 1 y 1000
random_number=$((1 + $RANDOM % 1000))

echo -e "\nEnter your username:"
read username


# BUSCAR SI ESTABA EN LA BASE DE DATOS 
PLAYER_NAME=$($PSQL "SELECT name FROM users WHERE name='$username'")  
if [[ -z $PLAYER_NAME ]]
then
    echo "Welcome, $username! It looks like this is your first time here."
    ALMACENAR=$($PSQL "INSERT INTO users(name) VALUES('$username')")  
    PLAYER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$username'")
else 
   # OBTENEMOS EL NÚMERO DEL JUGADOR
   PLAYER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$username'")
   # MEJOR PARTIDA
   best_game=$($PSQL "SELECT MIN(number_of_guesses) AS best_game FROM games WHERE user_id = '$PLAYER_ID'");
   # PARTIDAS JUGADAS
   games_played=$($PSQL "SELECT COUNT(*) AS total_games FROM games WHERE user_id = '$PLAYER_ID'");
   echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi
# Inicializar el contador de intentos
attempts=1
# Iniciar el juego
echo "Guess the secret number between 1 and 1000:"
while true; do   
     read guess
      # Verificar si la entrada es un número entero
    if [[ $guess =~ ^[0-9]+$ ]]; then
        # Si es un número entero, continuar
        if [[ $guess -eq $random_number ]]; then
        echo -e "\nYou guessed it in $attempts tries. The secret number was $random_number. Nice job!" 
        GUARDAR_PARTIDA=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($PLAYER_ID, $attempts)") 
        break
    elif [[ $guess -gt $random_number ]]; then
        echo "It's lower than that, guess again:"
    else
        echo "It's higher than that, guess again:"
    fi
    ((attempts++))
    else
        # Si no es un número entero, mostrar el mensaje y continuar el bucle
        echo "That is not an integer, guess again:"
    fi
done

