#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"

SERVICE_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\nWelcome to My Salon, how can I help you?"
  echo -e "\n1) Cut"
  echo "2) Color"
  echo "3) Perm"
  read SERVICE_ID_SELECTED

  # validate input
  case $SERVICE_ID_SELECTED in
  1) COLLECT_INFO ;;
  2) COLLECT_INFO ;;
  3) COLLECT_INFO ;;
  *) SERVICE_MENU "Invalid selection. Please choose a service number" ;;
  esac
}

COLLECT_INFO(){
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\n You are going to make an appointment for $SERVICE_NAME"
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # does the customer exist?
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # customer does not exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # ask for name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # add new customer to the customers table
    ADD_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $ADD_NEW_CUSTOMER_RESULT = "INSERT 0 1" ]]
    then 
      echo -e "\nYou are added into out customer list."
    fi
  fi
  # customer exists
  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # ask for time
  echo -e "\nWhat time would you like your '$SERVICE_NAME', '$CUSTOMER_NAME'?"
  read SERVICE_TIME
  # add new appointment to the appointments table
  ADD_NEW_AAPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $ADD_NEW_AAPOINTMENT_RESULT = "INSERT 0 1" ]]
  then
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SERVICE_MENU