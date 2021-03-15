Classes (Potentially)

Player
- Belongs to a Set
- Belongs to a Tournament
- #Set_History
- #Sets_Won
- #Sets_Lost
- #Tournaments_Won
- .Best_Record
- Attributes: Slug, GamerTag, Twitter, Discord, Twitch, Pronoun, State, Country, Player_ID


Sets
- Belongs to Tournament
- Player_1 and Player_2
- #Winner
- #Tournament


Tournament
- #Name 
- #Date
- #Sets

CLIManager

SggApi
- #get_user
- #get_users_in_tournament