
#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  while true
  do
    # Display all available services
    AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

    echo "$AVAILABLE_SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done

    # Ask the user to select a service
    read SERVICE_ID_SELECTED

    # Check whether the selected service exists
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    if [[ -n $SERVICE_NAME ]]
    then
      break
    fi

    echo -e "\nI could not find that service. What would you like today?"
  done

  # Ask for the customer's phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Look up the customer by phone number
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Register a new customer if the phone number is not found
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  # Get the customer's ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Ask for the appointment time
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # Save the appointment
  INSERT_APPT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Remove leading and trailing whitespace
  CLEAN_SERVICE=$(echo "$SERVICE_NAME" | sed -E 's/^ *| *$//g')
  CLEAN_NAME=$(echo "$CUSTOMER_NAME" | sed -E 's/^ *| *$//g')

  # Confirm the appointment
  echo -e "\nI have put you down for a $CLEAN_SERVICE at $SERVICE_TIME, $CLEAN_NAME."
}

MAIN_MENU