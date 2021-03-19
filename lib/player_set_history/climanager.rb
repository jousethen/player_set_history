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
    player_hash = importer.import_user_from_sgg(input)
    
    player = PlayerSetHistory::Player.create_from_json(player_hash, importer)
    
    puts `clear`
    puts "Player Sponsor: #{player.prefix}"
    puts "Player Tag: #{player.tag}"
    puts "Player Pronouns: #{player.pronoun}"
    puts "Player Sponsor: #{player.prefix}"
    puts "Player Sponsor: #{player.prefix}"
    puts "Player Sponsor: #{player.prefix}"
    puts "Player Sponsor: #{player.prefix}"
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

