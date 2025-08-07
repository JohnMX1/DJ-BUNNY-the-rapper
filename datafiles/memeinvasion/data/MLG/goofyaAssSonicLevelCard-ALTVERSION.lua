local levelName = songName



function onCreate()
	makeLuaSprite('circle', 'levelCircletest', -800, 80)
	--makeLuaSprite('text', 'levelTextest', -800, 80)
	makeLuaText('text', songName, 500, -800, 150)

	
	
	addLuaSprite('circle', true)
	addLuaText('text')

	scaleObject('circle', 2, 2)
	scaleObject('text', 2, 2)
	setObjectCamera('circle', 'other')
	setObjectCamera('text', 'other')
	setObjectCamera('theblack', 'hud')
	
	
	--setTextItalic('text', true)
	setTextSize('text', 66)

	setTextFont('text', 'sonic.ttf')
	--setTextItalic('text', true)
	
	makeLuaSprite('theblack', 'levelDarkness', 900, -40)
	addLuaSprite('theblack', true)
	scaleObject('theblack', 6, 8)
	setProperty('theblack.alpha', 0)
end

function onCreatePost()
	setProperty('CountGO.visible', false)
	setProperty('CountThree.visible', false)
	setProperty('CountTwo.visible', false)
	setProperty('CountOne.visible', false)


end


function onUpdatePost() -- make sure the countdown numbers arent visible
	setProperty('introSoundsSuffix', 'muted')          -- comment or remove this line and the lines below if you want the sound back
    setProperty('countdownReady.visible', false)
    setProperty('countdownSet.visible', false)
    setProperty('countdownGo.visible', false)
end


function onCountdownTick(counter)
	if counter == 0 then ---> "Three"
		levelNameSlideIn()
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	elseif counter == 3 then
		levelNameSlideOut()
		
	elseif counter == 4 then
		levelNameFadeOut()
		
	end
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
end

function levelNameSlideIn()
		doTweenX('textGo', 'text', 100, 1.5, 'backOut')
		doTweenX('circleGo', 'circle', 300, 1.5, 'smoothStepOut')
		doTweenX('oh black', 'theblack', -400, 1.5, 'backOut')
		doTweenAlpha('hi black', 'theblack', 100, 1, 'linear')
end

function levelNameSlideOut()
		doTweenY('textBye', 'text', -500, 1.2, 'backIn')
		doTweenY('circleBye', 'circle', -500, 1.2, 'backIn')
end

function levelNameFadeOut()
		doTweenAlpha('textGone', 'text', 0, 1, 'linear')
		doTweenAlpha('circleGone', 'circle', 0, 1, 'linear')
		doTweenAlpha('bye black', 'theblack', 0, 1, 'linear')
end