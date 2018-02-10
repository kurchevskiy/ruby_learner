class Ship
	attr_accessor :state
	attr_reader :is_stranger, :ship_size
	@state = nil
	
	# ship = Ship.new true, 4
	# stranger  = true|false 
	#
	def initialize stranger, ship_size
    @is_stranger = stranger 
    if (1..4).include?(ship_size)
    	@ship_size = ship_size
    else 
    	raise "Невернывый размер Ship"
    end
  end

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