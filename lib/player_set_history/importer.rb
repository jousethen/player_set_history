class PlayerSetHistory::Importer
  attr_accessor :url, :token
  
  def initialize(url = "https://api.smash.gg/gql/alpha", token = "97db6a94b20d4004ba9ad54d37d6a290", game_id = "22406")
    @url = url
    @token = token
    @game_id = game_id
  end
  
  def user_query()
    return %{
      query Users($slug: String) {
         user(slug: $slug) {
          genderPronoun
          discriminator
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
    }
  end
  
  def set_query()
    return %{
      query Users($slug: String, $pid: ID) {
        user(slug: $slug) {
          events(query: { page: 1, perPage: 100, filter: { videogameId: @game_id } }) {
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
    }
  end
  
  def import_user_from_sgg(slug_str)
    q = user_query
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
    
    return JSON.parse(result.response.body)["data"]["user"]
  end
  
  def import_sets_from_sgg(slug_str, pid_str)
    q = set_query
    variables = {
      "slug": "08e32f96",
      "pid": "15866"
    }
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
    
    return JSON.parse(result.response.body)["data"]["user"]
  end
end