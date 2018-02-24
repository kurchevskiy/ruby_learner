require_relative 'coord'

class Ship
  attr_accessor :state, :coords, :name
  attr_reader :is_stranger, :ship_size, :total_ships
  
  COUNT_SHIP = 10
  COUNT_DECK_ONE = 1
  COUNT_DECK_TWO = 2
  COUNT_DECK_THREE = 3
  COUNT_DECK_FOUR = 4

  COUNT_SHIPS_ONE = 1
  COUNT_SHIPS_TWO = 2
  COUNT_SHIPS_THREE = 3
  COUNT_SHIPS_FOUR = 4

  STATUS_WOUNDED = 'Ранен'
  STATUS_WHOLE = 'Цел'
  STATUS_KILL = 'Убит'

  @state = nil
  @ship_size = 0 # Обнуляем размер кораблика
  @@ships = {}
  @@total_ships = 0

  class << self 

     def add_ship(size)
      raise 'Извините, но ваш кораблик не достроен. Достройте его, а то он утонет!' unless @@total_ships < COUNT_SHIP
      if @@ships.has_key?(size)
        @@ships[size] = @@ships[size]+1
      else
        @@ships[size] = 1
      end
      @@total_ships += 1
    end

     def how_many(size)
      case size
      when COUNT_DECK_ONE
        COUNT_SHIPS_FOUR
      when COUNT_DECK_TWO
        COUNT_SHIPS_THREE
      when COUNT_DECK_THREE
        COUNT_SHIPS_TWO
      when COUNT_DECK_FOUR
        COUNT_SHIPS_ONE
      else
        "Введено некорректное количество координат кораблика. Пожалуйста, введите число от #{COUNT_DECK_ONE}-#{COUNT_DECK_FOUR}"
      end
    end

    def count_by_deck(size)
      @@ships[size]
    end

    def check_count_ships(size)
      self.count_by_deck(size) == self.how_many(size)
    end
    
  end

  # ship = Ship.new true, 4
  # stranger  = true|false 
  # ship_size кол-во клеток
  def initialize(ship_name, ship_size, stranger=false)
    raise 'Невернывый размер Ship' unless (COUNT_DECK_ONE..COUNT_DECK_FOUR).include?(ship_size.to_i) 
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

  def how_many_ships(size)
    case size
    when COUNT_DECK_ONE
      4
    when COUNT_DECK_TWO
      3
    when COUNT_DESK_THREE
      2
    when COUNT_DESC_FOUR
      1
    else
      "Введено некорректное количество координат кораблика. Пожалуйста, введите число от #{}-4"
    end
  end

  # Добавление координаты кораблику
  def add(x, y)
    raise 'Кораблик уже достроен' if ready?
    @coords << Coord.new(x.to_i, y.to_i)
  end

  # Добавление координат и размера кораблика
  def add_coords(ship_size, coords)
    raise 'Извините, но ваш кораблик не достроен. Достройте его, а то он утонет!' unless ship_size.to_i == coords.size
    @ship_size = ship_size.to_i
    coords.collect{|coord| @coords << Coord.new(coord[0].to_i, coord[1].to_i)}
  end

  # Проверка достроен ли кораблик 
  def ready?
    @ship_size == @coords.size
  end

end