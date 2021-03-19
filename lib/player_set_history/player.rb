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
    attributes = {
      :pronoun => user_hash["genderPronoun"],
      :state => user_hash["location"]["state"],
      :country => user_hash["location"]["country"],
      :slug => user_hash["discriminator"],
      :player_id => user_hash["player"]["id"],
      :tag => user_hash["player"]["gamerTag"],
      :prefix => user_hash["player"]["prefix"],
    }
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
  
  def self.create_from_tag(prefix: "", tag:)
    attributes = {:prefix => prefix, :tag => tag}
    player = PlayerSetHistory::Player.new(attributes)
    return player
  end
  
  def self.find_or_create_from_tag(tag)
    player_index = self.all.index {|x| x.tag.downcase == tag.downcase}
    
    
    if player_index == nil
      player = PlayerSetHistory::Player.create_from_tag(tag: tag)
    else 
      player = self.all[player_index]
    end
    
    return player
  end
  
  def find_or_create_from_slug(slug)
    player = self.all.index {|x| x.slug == slug}
    
    if player == nil
      importer = PlayerSetHistory::Importer.new()
      r_player = importer.import_user_from_sgg(slug)
      player = PlayerSetHistory::Player.create_from_json(r_player)
    end
    
    return player
  end
  
  
  
end