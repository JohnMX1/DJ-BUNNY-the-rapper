allowCountdown = false

function onStartCountdown()
	if not allowCountdown then
		playSound('Sussy', 1, 'tag')
		playSound('deniedMOMENT', 1, 'no')
		return Function_Stop
	end
end

function onSoundFinished(tag)
	if tag == 'tag' then
		allowCountdown = true
		startCountdown()
		doTweenX('gf', 'gf', 1500, 0.5, ease)
	end
end