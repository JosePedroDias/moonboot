-- converts screen coords and applies unified logic to pressed, moved and released events,
-- whether they came from mouse or touch
-- assumes screen module to be in use already

(love, screen) ->
	if love.pressed
		pressed = (x, y) ->
			x, y = screen.coords x, y
			love.pressed x, y

		love.mousepressed = (x, y, b, isTouch) ->
			if not isTouch
				pressed x, y

		love.touchpressed = (id, x, y, pressure) ->
			pressed x, y

	if love.moved
		moved = (x, y) ->
			x, y = screen.coords x, y
			love.moved x, y

		love.mousemoved = (x, y, dx, dy) ->
			moved x, y

		love.touchmoved = (id, x, y, pressure) ->
			moved x, y

	if love.released
		released = (x, y) ->
			x, y = screen.coords x, y
			love.released x, y

		love.mousereleased = (x, y, b, isTouch) ->
			if not isTouch
				released x, y

		love.touchreleased = (id, x, y, pressure) ->
			released x, y
