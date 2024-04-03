#! /bin/bash
# comprobar si se ha introducido mas de un argumento
if [[ $# -gt 1 ]]; 
then
    echo "Additional arguments are not allowed."
    exit
fi
if [[ -z $1 ]]
then
    # el argumento uno no puede ir vacio
    echo "Please provide an element as an argument."
    exit
else

     # conectar a la base de datos
     PSQL="psql -X --username=postgres --dbname=periodic_table --tuples-only -c"

     if [[ $1 =~ ^[0-9]+$ ]]
     then
        # $1 es un número consulta  de elementos por atomic_number
         DESCRIPCION_RESULTANTE=$($PSQL "SELECT 'The element with atomic number ' || e.atomic_number || ' is ' || e.name ||' (' || e.symbol|| '). ' || 'It''s a nonmetal, with a mass of ' || p.atomic_mass || ' amu. ' ||
         e.name || ' has a melting point of ' || p.melting_point_celsius || ' celsius and a boiling point of ' ||
         p.boiling_point_celsius || ' celsius.'
          AS element_info
         FROM elements e JOIN  properties p ON e.atomic_number = p.atomic_number
         JOIN types t ON p.type_id = t.type_id WHERE e.atomic_number=$1;")    
     else 
       # Comprobar la longitud de la cadena $1
       if (( ${#1} < 3 )); then
       # buscar el elemento por el symbolo
          DESCRIPCION_RESULTANTE=$($PSQL "SELECT 'The element with atomic number ' || e.atomic_number || ' is ' || e.name ||' (' || e.symbol|| '). ' || 'It''s a nonmetal, with a mass of ' || p.atomic_mass || ' amu. ' ||
         e.name || ' has a melting point of ' || p.melting_point_celsius || ' celsius and a boiling point of ' ||
         p.boiling_point_celsius || ' celsius.'
          AS element_info
         FROM elements e JOIN  properties p ON e.atomic_number = p.atomic_number
         JOIN types t ON p.type_id = t.type_id WHERE e.symbol='$1';")
       else
       # buscar el elemento por el nombre
         DESCRIPCION_RESULTANTE=$($PSQL "SELECT 'The element with atomic number ' || e.atomic_number || ' is ' || e.name ||' (' || e.symbol|| '). ' || 'It''s a nonmetal, with a mass of ' || p.atomic_mass || ' amu. ' ||
         e.name || ' has a melting point of ' || p.melting_point_celsius || ' celsius and a boiling point of ' ||
         p.boiling_point_celsius || ' celsius.'
          AS element_info
         FROM elements e JOIN  properties p ON e.atomic_number = p.atomic_number
         JOIN types t ON p.type_id = t.type_id WHERE e.name='$1';") 
      
       fi
     fi
     if [[ -z $DESCRIPCION_RESULTANTE ]]
     then
         echo "I could not find that element in the database."
         exit
     else
       echo $DESCRIPCION_RESULTANTE  
     fi
fi