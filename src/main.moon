screen = require 'screen'

la = love.audio
le = love.event
lf = love.filesystem
lg = love.graphics
lw = love.window

t = 0
positions = {}
local font, sfx, save, W, H, w, h



love.load = () ->
  font = lg.newImageFont 'images/font1.png', " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\""
  lg.setFont font
  sfx = la.newSource 'sounds/kick.wav', 'static'
  
  save  = lf.newFile 'data.txt'
  save\open 'r'
  data = save\read!
  print 'data:' .. data
  --save\open 'w'
  --save\write 'hello world'
  save\close!

  lw.setTitle 'moon boot'
  W, H = screen.getHighestResolution!
  screen.setSize W, H, 400, 400



love.update = (dt) ->
  t += dt



love.draw = () ->
  screen.startDraw!

  lg.setColor 255, 0, 255
  lg.rectangle 'fill', 0, 0, 128, 64
  
  lg.setColor 0, 255, 255
  for _,v in ipairs positions
    lg.circle 'fill', v[1], v[2], 10, 16

  lg.setColor 255, 255, 255
  lg.print "hello world #{t}!"

  screen.endDraw!



love.keypressed = (k) ->
  if k == 'escape'
    le.quit()



love.mousepressed = (x, y) ->
  x, y = screen.coords x, y
  positions[#positions + 1] = {x, y}
  if sfx\isPlaying!
    sfx\stop!
  sfx\play!
