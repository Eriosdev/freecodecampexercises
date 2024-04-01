#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
# BORRAR=$($PSQL "TRUNCATE customers, appointments CASCADE;")
echo -e "\n~~~~~ Servicio citas peluquería ~~~~~\n"
MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

echo "Seleccione un servicio:"
AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services") 
 # Leer cada línea de la salida y formatearla
echo "$AVAILABLE_SERVICES" | while read SERVICE_ID SERVICE_NAME
do
   SERVICE_NAME=$(echo "$SERVICE_NAME" | sed 's/ *| *//;s/^[[:space:]]*//;s/[[:space:]]*$//')
   echo "$SERVICE_ID) $SERVICE_NAME." 
done
  read SERVICE_ID_SELECTED
  # BUSCAR LA SELECCION EN EL LSITA DE SERVICIOS
   if [ "$SERVICE_ID_SELECTED" -eq 99 ]
  then
     EXIT 
     exit 0
  fi
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

   if [ -z $SERVICE_ID ]
  then
    MAIN_MENU "Introduce una  servicio valida"
  else
    # echo -e "\nel servicio seleccionado es: $SERVICE_ID_SELECTED"
    RESERVAR_CITA
  fi
}

RESERVAR_CITA() {
    # SERVICE_ID_SELECTED
    echo -e "\nWhat's your phone number?"
     # CUSTOMER_PHONE
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")    
    if [[ -z $CUSTOMER_NAME ]]
    then
       # PREGUNTAMOS EL NOMBRE Y LUEGO INSERTAMOS EL REGISTRO EN CUSTOMERS
       echo -e "\nI don't have a record for that phone number, what's your name?"
       # CUSTOMER_NAME
       read CUSTOMER_NAME   
       INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi 
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")   
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'") 
    # RESERVAMOS LA CITA 
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
    echo "¿a que hora quieres la cita?"
    #  SERVICE_TIME
    read SERVICE_TIME
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
  then
    CUSTOMER_NAME=$(echo "$CUSTOMER_NAME" | sed 's/^[[:space:]]*//')
    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi 
}

MAIN_MENU
