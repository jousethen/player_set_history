class PlayerSetHistory::Set
  attr_accessor :players, :tournament, :score, :winner, :id
  @@all = []
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)} 
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.create_sets_from_player(event_hash, importer)
    #Get one of the players 
    player_1 = PlayerSetHistory::Player.find_or_create_from_slug(event_hash["discriminator"], importer)
    
    event_hash["events"]["nodes"].each do |event|
      # Find or create tournament
      tourny = PlayerSetHistory::Tournament.find_or_create_from_name(
        event["tournament"]["name"], 
        event["tournament"]["startAt"]
      )
      
      # create sets 
      if event["sets"]["nodes"] != nil # Prevents error when event is nil
        event["sets"]["nodes"].each do |set|
          score = set["displayScore"]
          id = set["id"]
          player_2 = nil 
          winner_score = 0 
          winner = ""
          
          unless set_exists?(id)
            score.split(" - ").each do |player|
              # Parse score
              if player.include?("|")
                player_tag = player[0..-3].split(" | ")[1]
                player_prefix = player.split(" | ")[0]
              else
                player_tag = player[0..-3]
                player_prefix = ""
              end
              
              # create player_2 if neccessary
              if player_tag != player_1.tag 
                player_2 = PlayerSetHistory::Player.find_or_create_from_tag(tag: player_tag, prefix: player_prefix)
              end
              
              # Find winner
              if player[-1].to_i > winner_score
                winner_score = player[-1].to_i
                winner = player_tag
              end
            end
          
        
            set_attributes = {players: [player_1, player_2], 
                              score: score, 
                              id: id,
                              winner: winner, 
                              tournament: tourny
            }
            new_set = PlayerSetHistory::Set.new(set_attributes)
            tourny.add_set(new_set)
          end
        end
      end
    end
  end
  
  def self.set_exists? (set_id)
    sets = self.all.any? do |set|
      set.id == set_id
    end
  end
end