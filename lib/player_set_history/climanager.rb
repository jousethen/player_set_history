class PlayerSetHistory::CLIManager
  attr_accessor :api_key, :api_url
  
  def initialize(api_url: "https://api.smash.gg/gql/alpha", api_key:)
    @api_key = api_key
    @api_url = api_url
  end
  
  def call
    input = ""
    puts "Welcome! Please Choose the number game we will be pulling sets from"
    puts "1) Street Fighter V: Champion Edition 33990"
    puts "2) Guilty Gear Accent Core Plus R 22406"
    puts "3) Guilty Gear Xrd Rev 2 36"
    puts "4) Guilty Gear Strive 33945"
    puts "5) Tekken 7 17"
    puts "6) Smash Ultimate 1386"
    puts "7) Mortal Kombat 11 3200"
    
    
    
    until input.to_i.between?(1,7) do
      puts "The input must be a valid number"
      input = gets.chomp
    end
    
    game_id = get_game_id(input)
    puts `clear`
    
    input = ""
    puts "Please enter the players slug: \n\n"
    puts "*To find the player slug, go to their smash.gg profile. You can pull it from the page itself or the url*: \n\nSample: Smash.gg/user/[slug]"
    
    until input != "" do
      input = gets.chomp
    end
    puts "Loading..."
    
    
    importer = PlayerSetHistory::Importer.new(@api_url, @api_key, game_id)
    player = PlayerSetHistory::Player.find_or_create_from_slug(input, importer)
    
    puts `clear`
    puts "----------------------"
    puts "|   Player Profile   |"
    puts "----------------------"
    puts "\n"
    puts "Sponsor: #{player.prefix}"
    puts "Tag: #{player.tag}"
    puts "Pronouns: #{player.pronoun}"
    puts "Location: #{player.state}, #{player.country}"
    puts "Twitter: #{player.twitter}"
    puts "Discord: #{player.discord}"
    puts "Twitch: #{player.twitch}"
    
    input = ""
    
    puts "What would you like to do?"
    puts "1) Retrieve set history for player"
    puts "2) Retrieve head-to-head set history between players"
    
    
    until input.to_i.between?(1,2) do
      puts "The input must be a valid number"
      input = gets.chomp
    end
    puts `clear`
    puts "Loading..."
    
    importer.import_sets_from_sgg(player.slug, player.player_id)
    
    if input == "1"
      sets = player.get_all_sets
      puts sets[0].score
      
    else
    end
    
  end
  
  
  def get_game_id (num)
    case num
      when "1"
        return "33990"
      when "2"
        return "22406"
      when "3"
        return "36"
      when "4"
        return "33945"
      when "5"
        return "17"
      when "6"
        return "1386"
      when "7"
        return "3200"
      end
  end
  
end

