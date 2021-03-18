require 'date'

class PlayerSetHistory::Tournament
  attr_accessor :sets, :date, :name
  attr_reader :winner
  @@all = []
  
  def initialize (name, date)
    @name = name
    @date = DateTime.strptime(date,'%s')
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
 def add_set(set)
   @sets << set
 end
 
 def find_tournament_by_name (name)
   return self.all.index {|x| x.name == name}
 end
 
end