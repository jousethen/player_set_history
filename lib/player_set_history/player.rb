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
  
  def self.create_from_json(user_hash)
    attributes = {}
    attributes[:pronoun] = user_hash["genderPronoun"]
    attributes[:state] = user_hash["location"]["state"]
    attributes[:country] = user_hash["location"]["country"]
    attributes[:slug] = user_hash["discriminator"]
    attributes[:player_id] = user_hash["player"]["id"]
    attributes[:tag] = user_hash["player"]["gamerTag"]
    
    
  end
end