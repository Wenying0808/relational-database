#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Empty the rows from the tables
echo $($PSQL "TRUNCATE TABLE games, teams;")
# Read the CSV file and insert unique teams into the teams table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  # prevent from inserting column header form games.csv
  if [[ $WINNER != "winner" ]]
  then
    # insert unique winner team to teams table
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if winner is not found
    if [[ -z $TEAM_ID ]]
    then 
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
    fi
    # Insert unique opponent team into teams table
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $OPPONENT"
      fi
    fi
  fi
done

# Read the CSV file and insert game data into the games table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # prevent from inserting column header form games.csv
  if [[ $YEAR != "year" ]]
  then
   # get winner_id and opponent_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    INSERT_GAMES_RESULTS=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAMES_RESULTS == "INSERT 0 1" ]]
    then
      echo "Inserted into games table, $YEAR $ROUND"
    fi
  fi  
done