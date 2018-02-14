class Ship
  attr_accessor :state # cостояние
  attr_reader :is_stranger, :ship_size
  @state = nil
  
  # ship = Ship.new true, 4
  # stranger  = true|false 
  # ship_size кол-во клеток
  def initialize stranger, ship_size
    raise 'Невернывый размер Ship' unless (1..4).include?(ship_size) 
    @is_stranger = stranger 
    @ship_size = ship_size
  end

  # Состояние коробля
  def status
    case @state
    when true
      'ранен'
    when false
      'Убит'
    else
      'цел'
    end                     
  end

end