class Player
  include Comparable
  attr_accessor :lacky_shots

  def initialize(shots = 0)
    self.lacky_shots = shots.to_i
  end

  def <=>(player)
    lacky_shots <=> player.lacky_shots
  end
end