class PlayerSetHistory::Player
  attr_accessor :slug, :tag, :twitter, :discord, :twitch, :pronoun, :state, :country, :player_id, :prefix, :sets
  @@all = []
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)} 
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_player_attributes(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def self.create_from_json(user_hash)
    attributes = {}
    attributes[:pronoun] = user_hash["genderPronoun"]
    attributes[:state] = user_hash["location"]["state"]
    attributes[:country] = user_hash["location"]["country"]
    attributes[:slug] = user_hash["discriminator"]
    attributes[:player_id] = user_hash["player"]["id"]
    attributes[:tag] = user_hash["player"]["gamerTag"]
    attributes[:prefix] = user_hash["player"]["prefix"]
    
    # Links
    user_hash["authorizations"].each do |url|
      
      social = ""
      social = url["url"]
      
      if social != nil
        if social.include?("twitter")
          attributes[:twitter] = social
        elsif social.include?("discord")
          attributes[:discord] = social
        elsif social.include?("twitch")
          attributes[:twitch] = social
        end
      end
    end
    
    player = PlayerSetHistory::Player.new(attributes)
    @@all << player
    return player
  end
  
  def self.create_from_tag(tag)
    
  end
end