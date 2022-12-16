#! /bin/bash
#Program to retrieve data from periodic table
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

#function to display the required information
SHOW_ELEMENT_INFO(){
    #if no element found
    if [[ -z $GET_ELEMENT ]]
        then
        echo I could not find that element in the database.
        else
        #display information
        echo $GET_ELEMENT | while IFS=" | " read ATOMIC_NUM SYMBOL NAME TYPE MASS MELTING BOILING
            do
                echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, 
                with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
            done 
    fi
}
#function to get the required information
GET_ELEMENT_INFO(){
    #if argument it's a number
    if [[ $1 =~ ^[0-9]+$ ]]
        then
        #getting element based on atomic number
        GET_ELEMENT=$($PSQL "SELECT elements.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements 
            JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$1")
    #if not a number
        else 
        #getting element based on symbol or name    
        GET_ELEMENT=$($PSQL "SELECT elements.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements 
            JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    fi
    #passing the element to function that displays it
    SHOW_ELEMENT_INFO $GET_ELEMENT
}

#if an argument is passed
if [[ $1 ]]
    then
    #passing the argument to the function that gets the info
        GET_ELEMENT_INFO $1
    #if no argument is passed
    else 
    echo Please provide an element as an argument.
fi