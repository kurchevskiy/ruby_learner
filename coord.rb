class Coord
  attr_accessor :ship_size, :coords, :ship_name
  
  @ship_size = 0  # Обнулить размер кораблика
  

  def initialize(x, y)
    @x, @y = x.to_i, y.to_i
    @coords    = Array.new # Пустой массив  
    @coords << [@x, @y]
  end

  # Создание кораблика
  # @todo Вынести в Ship
  def create_ship(ship_name, ship_size)
    raise 'Невернывый размер кораблика' unless (1..4).include?(ship_size.to_i) 
    @ship_name = ship_name
    @ship_size = ship_size.to_i
     
  end

  def add(x, y)
    raise 'Не указан размер коробля' if @ship_size == 0
    @coords << [x.to_i, y.to_i]
  end

  def is_ready
    @ship_size == @coords.size
  end
end