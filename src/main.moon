g = love.graphics
t = 0
positions = {}
local font, sfx

love.load = () ->
  font = g.newImageFont 'images/font1.png', " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\""
  g.setFont font
  sfx = love.audio.newSource 'sounds/kick.wav', 'static'

love.update = (dt) ->
  t += dt

love.draw = () ->
  g.setColor 255, 0, 255
  g.rectangle 'fill', 0, 0, 128, 64
  
  g.setColor 255, 255, 255
  g.print "hello world #{t}!"
  
  g.setColor 0, 255, 255
  for _,v in ipairs positions
    g.circle 'fill', v[1], v[2], 10, 16

love.keypressed = (k) ->
  if k == 'escape'
    love.event.quit()

love.mousepressed = (x, y) ->
  positions[#positions + 1] = {x, y}
  if sfx\isPlaying!
    sfx\stop!
  sfx\play!
