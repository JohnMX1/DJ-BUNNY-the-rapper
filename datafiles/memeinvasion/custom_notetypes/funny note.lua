random = 0
sustain = 0

images = {
	'funnythings/autism',
	'funnythings/bitter cole sawl',
	'funnythings/breaking point',
	'funnythings/deranged',
	'funnythings/dippin',
	'funnythings/fuckyou',
	'funnythings/lol',
	'funnythings/ricardo',
	'funnythings/shoebill',
	'funnythings/whitebeard'
}

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'funny note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'funnythings/note assets');
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	random = getRandomInt(0, #images - 1)

	if noteType == 'funny note' then
		if isSustainNote then
			sustain = sustain + 1
			if sustain == 1 then
				sustain = sustain - 1
				debugPrint(sustain)
				return Function_Stop
			end
		else
			makeLuaSprite('the image', images[random], 0, 0)
			setScrollFactor('the image', 0, 0);
			setObjectOrder('the image', getObjectOrder('boyfriendGroup') + 100)
			scaleObject('the image', 1.15, 1.15);
			screenCenter('the image')
			doTweenAlpha('image opacity', 'the image', 0, 0, 'linear')
			addLuaSprite('the image')
			runTimer('image stuffs', 0.1, 1)
			playSound('augh', 1)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'image stuffs' then
		doTweenAlpha('image tweens', 'the image', 1, 0.3, 'linear')
		runTimer('image stuff', 0.4, 1)
	end 
	if tag == 'image stuff' then
		doTweenAlpha('image tweens', 'the image', 0, 1, 'linear')
	end
end