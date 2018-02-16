require_relative 'coord'

class Ship
  attr_accessor :state, :coords, :name
  attr_reader :is_stranger, :ship_size
  @state = nil
  @ship_size = 0 # Обнуляем размер кораблика

  # ship = Ship.new true, 4
  # stranger  = true|false 
  # ship_size кол-во клеток
  def initialize(ship_name, ship_size, stranger=false)
    raise 'Невернывый размер Ship' unless (1..4).include?(ship_size.to_i) 
    raise 'Пустое имя для кораблика не допустимо' if ship_name == ''
    @name = ship_name
    @ship_size = ship_size.to_i
    @is_stranger = stranger 
    @coords = []
  end

  # Состояние коробля
  def status
    case @state
    when true
      'Ранен'
    when false
      'Убит'
    else
      'Цел'
    end                     
  end

  def self.how_many_ships(size)
    case size
    when 1
      4
    when 2
      3
    when 3
      2
    when 4
      1
    else
      'Введено некорректное количество координат кораблика. Пожалуйста, введите число от 1-4'
    end
    # raise 'Введено некорректное количество координат кораблика. 
    #       Пожалуйста, введите число от 1-4' unless (1..4).include?(size.to_i) 
    # if size == 1
    #   4
    # elsif size == 2
    #   3
    # elsif size == 3
    #   2
    # elsif size == 4
    #   1
    # end
  end

  # Добавление координаты кораблику
  def add(x, y)
    raise 'Кораблик уже достроен' if is_ready
    @coords << Coord.new(x.to_i, y.to_i)
  end

  def add_coords(ship_size, coords)
    raise 'Извините, но ваш кораблик не достроен. Достройте его, а то он утонет!' unless ship_size.to_i == coords.size
    @ship_size = ship_size.to_i
    #coords.map{|coord| @coords << Coord.new(coord[0].to_i, coord[1].to_i)}
    #coords.each{|coord| @coords << Coord.new(coord[0].to_i, coord[1].to_i)}
    coords.collect{|coord| @coords << Coord.new(coord[0].to_i, coord[1].to_i)}
  end
  
  # Проверка достроен ли кораблик 
  def is_ready
    @ship_size == @coords.size
  end

end