require 'animation'
require 'talking'
box = {}
player = {}
vol = 0
onplat = false
images = {}

function love.load()
 
  images[1] = love.graphics.newImage("data/back.png")
  player.x = 255
  player.y = 0
  player.w = 10;
  player.h = 10;
  function coln(wallx,wallw,wally,wallh,playerx,playery,playerh,playerw)  
  if wallx < playerx + playerw and
    playerx < wallx + wallw and
      wally < playery + playerh and
    playery < wally + wallh then
      return true
    end
    return false
  end
    function cb(x,y,w,h)
      rv = {}
      rv.x = x
      rv.y = y
      rv.w = w
      rv.h = h
      return rv
    end
  for i=1,2 do
    box[#box+1] = cb(i*355, 200, 255, 255)
  end
end

function love.update(dt)
  new = {}
  new.x = player.x
  new.y = player.y
  vol = vol+0.1
  if love.keyboard.isDown('d') then
    new.x = new.x+5
  elseif love.keyboard.isDown('a') then
    new.x = new.x-5
  end
  onplat = false
  for i=1,#box do
      if coln(box[i].x,box[i].w,box[i].y,box[i].h,new.x,new.y+vol,player.w,player.h) == true then
        onplat = true
      end
  end
  if onplat == false then
    new.y = new.y+vol
  else
    vol = 0
  end
  if love.keyboard.isDown('p') then
  pos = pos+1
  if pos > #dialouge  then
    pos = 0
  end
  
  if love.keyboard.isDown('space') and onplat == true then
    vol = -3
  end
  if vol < 0 then
    new.y = new.y+vol
  end
  end
  for i=1,#box do
      if coln(box[i].x,box[i].w,box[i].y,box[i].h,new.x,new.y+vol,player.w,player.h) == false then
        player.x = new.x
        player.y = new.y
      end
  end
end

function love.draw()
  for i=1,40 do
    love.graphics.draw(images[1], ((i-20)*800)-player.x/5, 0)
  end
  love.graphics.translate((-player.x-love.graphics.getWidth()/2)+love.graphics.getWidth(), (-player.y-love.graphics.getHeight()/2)+love.graphics.getHeight())
  for i=1,#box do
    love.graphics.rectangle('fill',box[i].x,box[i].y,box[i].w,box[i].h)
  end
  love.graphics.rectangle('fill', player.x, player.y, player.w, player.h)
  
  if pos < 1 then
    love.graphics.rectangle('line',player.x+200,player.y-280,200,100)
  end
  
end
