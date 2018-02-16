class Coord
  attr_accessor :x, :y
  def initialize(x, y)
    @x, @y = x.to_i, y.to_i
    @coords    = Array.new # Пустой массив  
    @coords << [@x, @y]
  end

end