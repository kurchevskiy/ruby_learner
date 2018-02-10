require "./ship"
begin
	ship = Ship.new false, 4

	p ship.is_stranger # Если true, то чужой. Если false, то свой
	p ship.ship_size   # Размер кораблика
	p ship.status      # состоянии кораблика
	ship.state = true  # изменение состояния
	p ship.status
	ship.state = false
	p ship.status
rescue Exception => e
	p e.message
end