function createAnimation(textures)
  anim = {}
  anim.delay = 1
  anim.frames = textures
  anim.curr = 1
  anim.playing = false
  anim.show = show
  anim.play = play
  anim.stop = stop
  anim.count = 0
  return anim
end
function show(anm, x, y)
  love.graphics.draw(anm.frames[anm.curr], x, y)
  anm.count = anm.count+1
  if anm.count > anm.delay then
    anm.count = 0
    if anm.playing == true then
      anm.curr = anm.curr+1
      if anm.curr > #anm.frames then
        anm.curr = 1
      end
    end
  end
end
function play(anm)
  anm.playing = true
end
function stop(anm)
  anm.playing = false
end
