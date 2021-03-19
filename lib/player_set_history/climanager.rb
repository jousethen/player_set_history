class PlayerSetHistory::CLIManager
  attr_accessor :api_key, :api_url
  
  def initialize(api_url: "https://api.smash.gg/gql/alpha", api_key:)
    @api_key = api_key
    @api_url = api_url
  end
  
  def call
    input = ""
    puts "Welcome! Please input the player slug to continue \n\n"
    puts "To find the player slug, go to their smash.gg profile. You can pull it from the page itself or the url: \n\nSample: Smash.gg/user/[slug]"
    
    while input == "" do
      input = gets.chomp
    end
    
  end
  
  
end