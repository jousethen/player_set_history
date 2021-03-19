class PlayerSetHistory::CLIManager
  attr_accessor :api_key, :api_url
  
  def initialize(api_url: "https://api.smash.gg/gql/alpha", api_key:)
    @api_key = api_key
    @api_url = api_url
  end
  
  def call
    input = ""
    puts "Welcome! Please Choose the game we will be pulling sets from"
    puts "Street Fighter V: Champion Edition 33990"
    puts "Guilty Gear Accent Core Plus R 22406"
    puts "Guilty Gear Xrd Rev 2 36"
    puts "Guilty Gear Strive 33945"
    puts "Tekken 7 17"
    puts "Smash Ultimate 1386"
    puts "Mortal Kombat 11 3200"
    puts "To find the player slug, go to their smash.gg profile. You can pull it from the page itself or the url: \n\nSample: Smash.gg/user/[slug]"
    
    while input == "" do
      input = gets.chomp
    end
    
  end
  
  
end