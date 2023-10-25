#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t -A -c"
echo -e "\nSelect the number of the desired service:\n"


SERVICES_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  echo $($PSQL "SELECT * FROM services") | sed 's/ /\n/g' | while read ROW
  do 
    SERVICE_ID=$(echo $ROW | sed 's/|.*//g')
    SERVICE=$(echo $ROW | sed 's/.*|//g')
    echo $SERVICE_ID")" $SERVICE
  done
  echo -e "\n"

  read SERVICE_ID_SELECTED
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE ]]
  then
    SERVICES_MENU "Service not found.  Select a number from the list below:"
  else
    echo -e "\nWhat is your phone number?\n"
    read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nWhat is your name?\n"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi

    echo -e "\nWhen would you like to receive this $SERVICE?\n"
    read SERVICE_TIME

    INSERT_APPT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
}

SERVICES_MENU



