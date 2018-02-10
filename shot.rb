class Shot
  ENEMY_SHIP = [4, 5, 6, 12, 9]
  
  def initialize
    @enemy_ship = ENEMY_SHIP
  end
  
  def shot x 
    @enemy_ship.include? x.to_i
  end

end