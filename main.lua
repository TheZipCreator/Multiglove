require 'animation'
require 'talking'

box = {}
player = {}
vol = 0
onplat = false
moving = false
images = {}

function love.load()
  images[1] = love.graphics.newImage("data/back.png")
  images[2] = love.graphics.newImage("data/player.png")
  player.x = 255
  player.y = 0
  player.w = 32;
  player.h = 96;
  animframes = {love.graphics.newImage("data/p1.png"),love.graphics.newImage("data/p2.png"),love.graphics.newImage("data/p3.png"),love.graphics.newImage("data/p4.png"),love.graphics.newImage("data/p5.png"),love.graphics.newImage("data/p4.png"),love.graphics.newImage("data/p3.png"),love.graphics.newImage("data/p2.png")}
  player.animation = createAnimation(animframes)
  player.animation.playing = true
  player.animation.delay = 5
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
  for i=1,100 do
    box[#box+1] = cb(i*455, 200, 255, 255)
  end
end

function love.update(dt)
  moving = false
  new = {}
  new.x = player.x
  new.y = player.y
  vol = vol+0.1
  if love.keyboard.isDown('d') then
    new.x = new.x+100
    moving = true
  elseif love.keyboard.isDown('a') then
    new.x = new.x-100
    moving = true
  end
  onplat = false
  for i=1,#box do
      if coln(box[i].x,box[i].w,box[i].y,box[i].h,new.x,new.y+vol,player.h,player.w) == true then
        onplat = true
      end
  end
  if onplat == false then
    new.y = new.y+vol
  else
    vol = 0
  end
  if love.keyboard.isDown('space') and onplat == true then
    vol = -3
  end
  if vol < 0 then
    new.y = new.y+vol
  end
  for i=1,#box do
    if coln(box[i].x,box[i].w,box[i].y,box[i].h,new.x,new.y,player.h,player.w) == false then
      player.x = new.x
      player.y = new.y
    end
  end
  temp = false
  if love.keyboard.isDown('p') then
    temp = true
    if pos > 0 and pp == false then
      pos = pos+1
      if pos > #di  then
        pos = 0
      end
    end
  end
  if temp == false then
    pp = false
  else
    pp = true
  end
end
function love.draw()
  for i=1,40 do
    love.graphics.draw(images[1], ((i-20)*800)-player.x/5, -player.y/5)
  end
  love.graphics.translate((-player.x-love.graphics.getWidth()/2)+love.graphics.getWidth(), (-player.y-love.graphics.getHeight()/2)+love.graphics.getHeight())
  for i=1,#box do
    love.graphics.rectangle('fill',box[i].x,box[i].y,box[i].w,box[i].h)
  end
  if moving == false then
    player.animation.curr = 2
  end
  show(player.animation, player.x, player.y)
  chatbx = player.x+200
  chatby = player.y-280
  if pos > 0 then
    love.graphics.rectangle('line',chatbx,chatby,200,100)
    love.graphics.print(di[pos].speaker,chatbx,chatby-15)
    love.graphics.print(di[pos].message,chatbx,chatby)
    print(di[pos].speaker)
  end
  
end
