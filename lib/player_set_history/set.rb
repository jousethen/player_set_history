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
  
  def self.create_player_sets(set_hash)
    set_hash["nodes"].each do |event|
      # Create tournament if they don't exist
      tourny = PlayerSetHistory::Tournament.find_tournament_by_name(
        event["tournament"]["name"])
      
      if tourny == nil
        tourny = PlayerSetHistory::Tournament.new(
        event["tournament"]["name"],              
        event["tournament"]["startAt"])
      end
      
      
      # create sets 
      event["sets"]["nodes"].each do |set|
        # Find Player
      end
      
    end
    
  end
end