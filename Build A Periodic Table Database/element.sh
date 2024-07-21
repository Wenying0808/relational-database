#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Store the argument
ARGUMENT=$1

if [[ $ARGUMENT ]]
  then
    # check if the argument is number
    if [[ ! $ARGUMENT =~ ^[0-9]+$ ]]
    then
      # Is the argument a string with more than 2 letters?
      # the argument is more than 2 letter
      if [[ ${#ARGUMENT} -gt 2 ]]
      then
        # get data using name
        DATA=$($PSQL "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE name='$ARGUMENT'")
        if [[ $DATA ]]
        then
          echo "$DATA" | while IFS='|' read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
          do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
          done
        else
         echo "I could not find that element in the database."
        fi
      # the argument is not more than 2 letter
      else
        # get the data using symbol
        DATA=$($PSQL "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE symbol='$ARGUMENT'")
        if [[ $DATA ]]
        then
          echo "$DATA" | while IFS='|' read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
          do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
          done
        else
         echo "I could not find that element in the database."
        fi
      fi
    else
      # get database using atomic_number
      DATA=$($PSQL "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number=$ARGUMENT")
        if [[ $DATA ]]
        then
          echo "$DATA" | while IFS='|' read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
          do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
          done
        else
          echo "I could not find that element in the database."
        fi
    fi

  # the argument is not provided when running script
  else 
    echo "Please provide an element as an argument."
fi

