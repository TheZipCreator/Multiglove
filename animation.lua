function createAnimation(textures)
  anim = {}
  anim.frames = textures
  anim.curr = 1
  anim.playing = false
  anim.show = show
  anim.play = play
  anim.stop = stop
  return anim
end
function show(x, y)
  love.graphics.draw(curr[i], x, y)
  if playing == true then
    curr = curr+1
    if curr > #frames then
      curr = 1
    end
  end
end
function play()
  playing = true
end
function stop()
  playing = false
end