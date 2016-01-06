g = love.graphics
local font

love.load = () ->
  font = g.newImageFont 'images/font1.png', " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\""
  g.setFont font

love.update = () ->
  noop

love.draw = () ->
  g.setColor 255, 0, 255
  g.rectangle 'fill', 0, 0, 128, 64
  g.print 'hello world'

love.keypressed = (k) ->
  if k == 'escape'
    love.event.quit()
