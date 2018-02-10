require "./ship"
begin
	ship = Ship.new false, 4

	# p ship.is_stranger
	p ship.ship_size
	p ship.status
	ship.state = true
	p ship.status
	ship.state = false
	p ship.status
rescue Exception => e
	p e.message
end