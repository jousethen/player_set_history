class PlayerSetHistory::Set
  attr_accessor :players, :tournament, :score
  attr_reader :winner
  @@all = []
  
  def initialize (player_1, player_2, score)
    @players << player_1
    @players << player_2
    @score = score
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.create_sets_from_player(event_hash)
    #Get one of the players 
    player_1 = PlayerSetHistory::Player.find_or_create_from_slug(event_hash["discriminator"])
    
    event_hash["events"]["nodes"].each do |event|
      # Find or create tournament
      tourny = PlayerSetHistory::Tournament.find_or_create_from_name(
        event["tournament"]["name"], 
        event["tournament"]["startAt"]
      )
      
      
      # create sets 
      event["sets"]["nodes"].each do |set|
        score = set["displayScore"]
        
        score.split(" - ").each do |player|
          player_name = player[0..-3].split(" | ")
           binding.pry
          if player_name[1] != player_1.tag 
            player_2 = PlayerSetHistory::Player.create_from_tag(tag: player_tag[1], prefix: player_[0])
           
          end
          
        end
        
      end
      
    end
    
  end
end