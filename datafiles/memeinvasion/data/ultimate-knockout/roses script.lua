allowCountdown = false

function onStartCountdown()
	if not allowCountdown then
		playSound('uii', 1, 'tag')
		return Function_Stop
	end
end

function onSoundFinished(tag)
	if tag == 'tag' then
		allowCountdown = true
		startCountdown()
	end
end