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
    
    event_hash["events"]["nodes"].each do |event|\
      # Find or create tournament
      tourny = PlayerSetHistory::Tournament.find_or_create_from_name(
        event["tournament"]["name"], 
        event["tournament"]["startAt"]
      )
      
      
      
      # create sets 
      event["sets"]["nodes"].each do |set|
        # Find Player
      end
      
    end
    
  end
end