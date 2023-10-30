#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else 

  if [[ $1 =~ [0-9]+ && ! -z $($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1") ]]
  then 
    ATOMIC_NUMBER=$1
    INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")

    echo $INFO | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME MASS MP BP TYPE
    do
      echo The element with atomic number $ATOMIC_NUMBER is $NAME \($SYMBOL\).  It\'s a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius. 
    done

  elif [[ $1 =~ [A-Za-z]{1,2} && ! -z $($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'") ]]
  then 
    SYMBOL=$1
    INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$SYMBOL'")

    echo $INFO | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME MASS MP BP TYPE
    do
      echo The element with atomic number $ATOMIC_NUMBER is $NAME \($SYMBOL\).  It\'s a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius. 
    done

  elif [[ $1 =~ [A-Za-z]{3,} && ! -z $($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'") ]]
  then 
    NAME=$1
    INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$NAME'")

    echo $INFO | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME MASS MP BP TYPE
    do
      echo The element with atomic number $ATOMIC_NUMBER is $NAME \($SYMBOL\).  It\'s a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius. 
    done
  
  else
    echo I could not find that element in the database.

  fi



fi
