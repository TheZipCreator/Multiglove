pos = 1
di = {}

function cd(sp, me)
rv = {}
rv.speaker = sp
rv.message = me
return rv
end
di[1] = cd("Castle Guard","Help us!") 
di[2] = cd("Castle Guard","Please?") 