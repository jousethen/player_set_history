# Made this before the project started.

Classes (Potentially)

Player
- Belongs to a Set
- Belongs to a Tournament
- #Set_History
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
- 

SAMPLE QUERY

@url = 'https://api.smash.gg/gql/alpha'
@token = '97db6a94b20d4004ba9ad54d37d6a290'

query = %{
query Users($slug: String) {
 user(slug: $slug) {
  genderPronoun
  location {
   state
   country
  }
  authorizations(types: [TWITCH, TWITTER, DISCORD]) {url}

  player {
   id
   gamerTag
   sets(perPage: 1, page: 1) {
    nodes {
     displayScore
     fullRoundText
     event {videogame {displayName}
      tournament {name}
     }
    }
   }
  }
 }
}}

variables = {
    slug: "356d0e24"
  }


result = HTTParty.post(
  @url,
  headers: { 
    'Content-Type'  => 'application/json', 
    'Authorization' => "Bearer #{@token}" 
  },
  body: { 
    query: query, 
    variables: variables 
  }.to_json
)

puts "#{result}"



SAMPLE RESULTS
{"genderPronoun"=>nil, "location"=>{"state"=>"CA", "country"=>"United States"},"authorizations"=>[{"url"=>"https://twitter.com/Kizzie_Kay310"}, {"url"=>"https://twitch.tv/Kizziekay310"}], "player"=>{"id"=>57141, "gamerTag"=>"Kizzie Kay"}}



just player info
query Users($slug: String) {
 user(slug: $slug) {
  genderPronoun
  location {
   state
   country
  }
  authorizations(types: [TWITCH, TWITTER, DISCORD]) {url}

  player {
   id
   gamerTag
    }
   }
  }
  
  GET ALL SETS FROM USER
  
 query Users($slug: String, $pid: ID) {
  user(slug: $slug) {
    events(query: { page: 1, perPage: 100, filter: { videogameId: 22406 } }) {
      nodes {
        tournament{
          name
          startAt
        }
        sets(filters: { playerIds: [$pid] }) {
          nodes {
            displayScore
          }
        }
      }
    }
  }
}


{
  "slug": "08e32f96",
  "pid": "15866"
}
