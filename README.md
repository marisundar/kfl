#### APIs for LivePages:

1. **overalTeamPlayers:**

Retrieves the all the available players in KFL

**Method:**
```
GET
```

**Input:**
```
None
```

**Output:**

```js
{
 playerId: String, // Unique Identified of player
 playerName: String, // FullName of the player (First Name, LastName)
 category: String, // Bowler/Batsma/All-Rounder
 iplTeam: String, // 3 letter idetifying IPL Team ( CSK)
 runFactor:int, // 1 for batsman, 2 for bowler
 teamId: int, // Unique Identified of team
 soldPrice: long, // Sellig price of the player
 auctionType: String // OPEN/CLOSED
}

```

2. **getAllTeamsTotalScores:**

Retrieves Total score by each team in KFL in descending order 

**Method:**
```
GET
```

**Input:**
```
None
```

**Output:**

```js
{
 teamId: int, // Unique Identified of team
 teamName: String, // Name of the team
 totalPoints: long, // Total points calculated for the team
}

```

3. **getPlayerScores:**

Retrieves Total score by player in team in KFL in descending order of points

**Method:**
```
GET
```

**Input:**
```
None
```

**Output:**

```js
{
 playerId: int, // Unique Identified of player
 teamId: int, // Unique Identified of team
 teamName: String, // Name of the team
 playerName: String, // Name of the player
 runPoints: long, // Total points obtained by runs
 fourPoints: long, // Total points obtained by fourPoints
 sixPoints: long, // Total points obtained by sixPoints
 runs25Points: long, // Total points obtained by getting 25
 strikeRatePoints: long, // Total points obtained by strike rate
 duckOutPoints: long, // Total points obtained by duck
 wicketPoints: long, // Total points obtained by wickets
 threeOr5WicketHaul: long, // Total points obtained by 3or5 wicket haul
 maidenPoints: long, // Total points obtained by maiden
 economyPoints: long, // Total points obtained by economy
 catchesPoints: long, // Total points obtained by catches
 stumpingPoints: long, // Total points obtained by stumping
 runOutPoints: long, // Total points obtained by runOutPoints
 momPoints: long, // Total points obtained by MOM
 battingPoints: long, // Total points obtained by batting = SUM(runPoints ,`fourPoints`, `sixPoints`, `runs25Points`, `strikeRatePoints` ,`duckOutPoints`)
 bowlingPoints: long, // Total points obtained by bowling = SUM(`wicketPoints`, `threeOr5WicketHaul`, `maidenPoints` ,`hatrickPoints`, `economyPoints`)
 fieldingPoints: long, // Total points obtained by fielding = SUM(`catchesPoints`, `stumpingPoints`, `runOutPoints`)
 otherPoints: long, // Total other points = SUM(`momPoints`),
 totalPoints: long, // Sum(`battingPoints`, `bowlingPoints`, `fieldingPoints`, `otherPoints`)
 iplTeam: String, // Three letter Ipl team name
 
}

```

4. **getTopThreePlayerScores:**

Retrieves Top three points scorer of the team, In descending order of points

**Method:**
```
GET
```

**Input:**
```js
{
   teamId: int // Unique identifier of the team
}
```

**Output:**

```js
{
 playerId: int, // Unique Identified of player
 teamId: int, // Unique Identified of team
 teamName: String, // Name of the team
 playerName: String, // Name of the player
 runPoints: long, // Total points obtained by runs
 fourPoints: long, // Total points obtained by fourPoints
 sixPoints: long, // Total points obtained by sixPoints
 runs25Points: long, // Total points obtained by getting 25
 strikeRatePoints: long, // Total points obtained by strike rate
 duckOutPoints: long, // Total points obtained by duck
 wicketPoints: long, // Total points obtained by wickets
 threeOr5WicketHaul: long, // Total points obtained by 3or5 wicket haul
 maidenPoints: long, // Total points obtained by maiden
 economyPoints: long, // Total points obtained by economy
 catchesPoints: long, // Total points obtained by catches
 stumpingPoints: long, // Total points obtained by stumping
 runOutPoints: long, // Total points obtained by runOutPoints
 momPoints: long, // Total points obtained by MOM
 battingPoints: long, // Total points obtained by batting = SUM(runPoints ,`fourPoints`, `sixPoints`, `runs25Points`, `strikeRatePoints` ,`duckOutPoints`)
 bowlingPoints: long, // Total points obtained by bowling = SUM(`wicketPoints`, `threeOr5WicketHaul`, `maidenPoints` ,`hatrickPoints`, `economyPoints`)
 fieldingPoints: long, // Total points obtained by fielding = SUM(`catchesPoints`, `stumpingPoints`, `runOutPoints`)
 otherPoints: long, // Total other points = SUM(`momPoints`),
 totalPoints: long, // Sum(`battingPoints`, `bowlingPoints`, `fieldingPoints`, `otherPoints`)
 iplTeam: String, // Three letter Ipl team name
 
}

```


5. **updatePowerPlayer:**

Updates powerplayer of the team

**Method:**
```
POST
```

**Input:**
```js
{
   teamId: int, // Team for which the powerplayer needs to updated
   playerId: int, // power player id who should be updated
   userId: String, // user who updated the powerplayer
}
```

**Output:**

```js
{
 isSuccess: boolean, // PowerPlayer update status
}
```

6. **getPowerPlayers:**

Returns current powerplayers for each team

**Method:**
```
GET
```

**Input:**
```js
None
```

**Output:**

```js
{
 playerId: int, // PowerPlayer id
 playerName: String // Full Name of the player
 teamId: int // Team id to which power player belongs to
}
```

7. **updatePlayerScores:**

Updates the scores of each player

**Method:**
```
POST
```

**Input:**
```js
{
    matchId: int, // Unique identifier of the match
	playedDate: DateTime, // Date and time of when the match was played
	players: List<Players>, //  Players score information
	
}

Players: {
   isOut: boolean, // false - NotOut, true - Out
   overs: long, // Number of overs bowled by a player
   wickets: long, // Number of wickets 
   runout: long, // Number of runouts 
   stumping: long, // Number of stumping 
   catches: long, // Number of catches 
   maiden: long, // Number of maiden 
   hatrick: long, // Number of hatrick 
   bowlingRuns: long, // Number of bowlingRuns 
   six: long, // Number of six 
   four: long, // Number of four 
   runs: long, // Number of runs 
   battingBalls: long, // Number of battingBalls 
   MOM: long, // Number of Man of the Match 
}
```

**Output:**

```js
{
 success: boolean // true if succeeded
}
```

8. **getDailyTeamPoints:**

Get total points of each team for each days in descending order of date and score

**Method:**
```
GET
```

**Input:**
```js
    None
```

**Output:**

```js
{
 playedDate: DateTime, // Match date
 teamName: String,
 teamId: int,
 totalPoints: long,
}
```

9. **getLastMatchId:**

Get last match id updated in the backend

**Method:**
```
GET
```

**Input:**
```js
    None
```

**Output:**

```js
{
 matchId: int, // Last match id
 
}
```

10. **isValidToUpdatePowerPlayer:**

Checks for logic => Should update before 20:00 in weekdays and before 16:00 on weekends ( Subjected to change)

**Method:**
```
GET
```

**Input:**
```js
    None
```

**Output:**

```js
{
 isValidToUpdate: boolean, // true if user can update powerplayer false otherwise
 
}
```


11. **getPlayerIndividualScores:**

Retrieves Total score by a player in team in KFL

**Method:**
```
GET
```

**Input:**
```
{
   playerId: int, // Player for which the total scores need to be calculated
   fromDate: DateTime (optional) // Calculate the score by the player from a particular date (used after re-action date)
   onDate: DateTime (optional) // If provided, return only the scores for that player on a particular day
}
```

**Output:**

```js
{
 playerId: int, // Unique Identified of player
 teamId: int, // Unique Identified of team
 teamName: String, // Name of the team
 playerName: String, // Name of the player
 runPoints: long, // Total points obtained by runs
 fourPoints: long, // Total points obtained by fourPoints
 sixPoints: long, // Total points obtained by sixPoints
 runs25Points: long, // Total points obtained by getting 25
 strikeRatePoints: long, // Total points obtained by strike rate
 duckOutPoints: long, // Total points obtained by duck
 wicketPoints: long, // Total points obtained by wickets
 threeOr5WicketHaul: long, // Total points obtained by 3or5 wicket haul
 maidenPoints: long, // Total points obtained by maiden
 economyPoints: long, // Total points obtained by economy
 catchesPoints: long, // Total points obtained by catches
 stumpingPoints: long, // Total points obtained by stumping
 runOutPoints: long, // Total points obtained by runOutPoints
 momPoints: long, // Total points obtained by MOM
 battingPoints: long, // Total points obtained by batting = SUM(runPoints ,`fourPoints`, `sixPoints`, `runs25Points`, `strikeRatePoints` ,`duckOutPoints`)
 bowlingPoints: long, // Total points obtained by bowling = SUM(`wicketPoints`, `threeOr5WicketHaul`, `maidenPoints` ,`hatrickPoints`, `economyPoints`)
 fieldingPoints: long, // Total points obtained by fielding = SUM(`catchesPoints`, `stumpingPoints`, `runOutPoints`)
 otherPoints: long, // Total other points = SUM(`momPoints`),
 totalPoints: long, // Sum(`battingPoints`, `bowlingPoints`, `fieldingPoints`, `otherPoints`)
 iplTeam: String, // Three letter Ipl team name
 
}

```

12. **checkIfPowerPlayerAlreadyUpdated:**

Checks for someone in the team already updated the powerplayer

**Method:**
```
GET
```

**Input:**
```js
  {
	teamId: int,
  }
```

**Output:**

```js
{
 isUpdated: boolean // returns true if powerPlayer already updated
 updatedBy: String, // Who updated the powerPlayer
 updatedAt: DateTime, // DateTime at which the power player was updated
 
}
```

13. **updateMatchInfo:**

Updates the match information

**Method:**
```
POST
```

**Input:**
```js
  {
	matchId: int,
	team1: String, // First team name
	team2: String, // Second team name
	description: String // Description of the match
  }
```

**Output:**

```js
{
 isUpdated: boolean // returns true if powerPlayer already updated
 updatedBy: String, // Who updated the powerPlayer
 updatedAt: DateTime, // DateTime at which the power player was updated
 
}
```

14. **getMatchUpdatedDetails:**

Retrieve match updated details

**Method:**
```
GET
```

**Input:**
```js
  NONE
```

**Output:**

```js
{
	matchId: int,
	team1: String, // First team name
	team2: String, // Second team name
	description: String // Description of the match
	updateTime: DateTime// when was score updated
  }
```

15. **deleteMatchInfo:**

Deletes particular match information 

**Method:**
```
POST
```

**Input:**
```js
  {
     matchId: int // Id for which the information has to be deleted
  }
```

**Output:**

```js
{
	success: boolean //  true if the delete is complete
  }
```

16. **isAdmin:**

Checks if the given user is a admin 

**Method:**
```
GET
```

**Input:**
```js
  {
     userId: int
  }
```

**Output:**

```js
{
	isAdmin: boolean //  true if the user is admin
  }
```
