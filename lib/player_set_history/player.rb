class PlayerSetHistory::Player
  attr_accessor :slug, :tag, :twitter, :discord, :twitch, :pronoun, :state, :country, :player_id, :sets
  @@all = []
  
  def initiliaze(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)} 
    @@all << self
  end
  
  def add_player_attributes(attributes)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
  end
  
end