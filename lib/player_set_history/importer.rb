class PlayerSetHistory::Importer
  attr_accessor :url, :token
  
  def initialize(url = "https://api.smash.gg/gql/alpha", token = "97db6a94b20d4004ba9ad54d37d6a290")
    @url = url
    @token = token
  end
  
  def query(page_num)
    return %{
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
         sets(perPage: 1, page: #{page_num}) {
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
      }
    }
  end
  
  def import_from_sgg(slug_str)
   q = query(1)
    variables = {slug: slug_str}
    result = HTTParty.post(
      @url,
      headers: { 
        'Content-Type'  => 'application/json', 
        'Authorization' => "Bearer #{@token}" 
      },
      body: { 
        query: q, 
        variables: variables 
      }.to_json
    )
    
    return result
    
  end
end