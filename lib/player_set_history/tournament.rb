require 'date'

class PlayerSetHistory::Tournament
  attr_accessor :sets, :date, :name
  attr_reader :winner
  @@all = []
  
  def initialize (name, date)
    @name = name
    @date = DateTime.strptime(date.to_s,'%s')
    @@all << self
    @sets = []
  end
  
  def self.all 
    @@all
  end
  
 def add_set(set)
   @sets << set
 end
 
 def self.find_or_create_from_name (name, date)
    tourny_index = self.all.index {|x| x.name == name}
    
    if tourny_index == nil
      tourny = PlayerSetHistory::Tournament.new(name, date)
    else
      tourny = self.all[tourny_index]
    end
    
    return tourny
 end
 
end