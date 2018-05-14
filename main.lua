box = {}
player = {}

function love.load()
  
  player.x = 10
  player.y = 10
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
    end
  box[1] = cb(100,100,10,100)
end

function love.update(dt)
  new = {}
  new.x = player.x
  new.y = player.y
    if love.keyboard.isDown('d') then
      new.x = new.x+5
    elseif love.keyboard.isDown('a') then
        new.x = new.x-5
    elseif love.keyboard.isDown('s') then
        new.y = new.y-5
    elseif love.keyboard.isDown('w') then
        new.y = new.y +5
    end
    
   for i=1,#box do
      if coln(box[i].x,box[i].y,box[i].w,box[i].h,player.x,player.y,player.w,player.h) == false then
             player.x = new.x
             player.y = new.y
    
    end
end
end
function love.graphics()
  for i=1,#box do
    love.graphics.rectangle('fill',box[i].x,box[i].y,box[i].w,box[i].h)
  end
  
  
  end