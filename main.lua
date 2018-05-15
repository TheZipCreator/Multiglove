box = {}
player = {}
vol = {}
onplat = false

function love.load()
  
  player.x = 10
  player.y = 10
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
  box[1] = cb(100,400,200,200)
end

function love.update(dt)
  new = {}
  new.x = player.x
  new.y = player.y
  vol = 2
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
  end
  for i=1,#box do
      if coln(box[i].x,box[i].w,box[i].y,box[i].h,new.x,new.y,player.w,player.h) == false then
        player.x = new.x
        player.y = new.y
      end
  end
end
function love.draw()
  for i=1,#box do
    love.graphics.rectangle('fill',box[i].x,box[i].y,box[i].w,box[i].h)
  end
  love.graphics.rectangle('fill', player.x, player.y, player.w, player.h)
  
  
end
