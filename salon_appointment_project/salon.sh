#! /bin/bash
#Script for salon appointment scheduler 
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  #if an argument is passed
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
  #greeting
  echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  DISPLAY_SERVICES
} 

DISPLAY_SERVICES(){
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  #display available services
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE BAR
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  SERVICE_APPOINTMENT
}

SERVICE_APPOINTMENT (){
  #get customer input
  read SERVICE_ID_SELECTED
  #if not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    #send to main menu
    MAIN_MENU "That's not a valid service number."
  else
    #get service based on id
    CHOSEN_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    #if not found
    if [[ -z $CHOSEN_SERVICE_NAME ]] 
    then
      #show services
      MAIN_MENU "I could not find that service. What would you like today?"
      #if found
      else
      #get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      #if not found
      if [[ -z $CUSTOMER_NAME ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        #insert new client
        INSERT_CLIENT_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      fi
      #make appointment
        #get customer id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        #get appointment time
        echo -e "\nWhat time would you like your $(echo $CHOSEN_SERVICE_NAME | sed -E 's/^ *//g'), $(echo $CUSTOMER_NAME | sed -E 's/^ *//g')?"
        read SERVICE_TIME 
        #insert appointment
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $(echo $CHOSEN_SERVICE_NAME | sed -E 's/^ *//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *//g')."
    fi
  fi
}

MAIN_MENU