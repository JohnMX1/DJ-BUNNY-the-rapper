-- vars don;t thouch
dcandodge = true
dodging = false
hintp1 = true
lolbitch = false

function onCreate()
	makeLuaSprite('Warning2', 'Warning', -1000, 0)
		setObjectCamera('Warning2', 'other')
	addLuaSprite('Warning2', true)

	precacheSound('attack')
    makeLuaSprite('Warning', 'Warning', -1000, 0)
   		setObjectCamera('Warning', 'other')
    addLuaSprite('Warning', true)

	makeLuaSprite('hint', 'hint', 0, 0)
		setObjectCamera('hint', 'other')
	addLuaSprite('hint', true)

	if downscroll == true then
		makeLuaText('massiveballs', '"TAB" For guide', 500, 0, 0)
			setTextSize('massiveballs', 35)
				setTextAlignment('massiveballs', 'left')
			setObjectCamera('massiveballs', 'other')
		addLuaText('massiveballs')
	else
		makeLuaText('massiveballs', '"TAB" For guide', 500, 0, 670)
			setTextSize('massiveballs', 35)
				setTextAlignment('massiveballs', 'left')
			setObjectCamera('massiveballs', 'other')
		addLuaText('massiveballs')
	end
end

function onCreatePost()
	doTweenColor('hehe', 'Warning2', 000000, 0.1, 'linear')
	setProperty('hint.alpha', 0)
	setTextFont('massiveballs', 'comic.ttf')
	dadX = getCharacterX('dad')
end

function onEvent(name, value1)
    local speed = value1

    if name == 'dodge' then
        	runTimer('dodgetimelol', speed)
        	runTimer('byewarn', speed + 0.05)
			runTimer('attk', speed - 0.2)
        doTweenX('Warningcummer', 'Warning', 0, speed - 0.05, 'elasticInOut')
		doTweenX('Warningcummer2', 'Warning2', 0, speed - 0.1, 'elasticInOut')

		if getProperty('cpuControlled') then
			runTimer('botdodge', speed - 0.05)
		end
    end
end

function onUpdate()
    if dcandodge and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and not gameOver then
        dodge()
    end
end

function onUpdatePost(elapsed)
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') and hintp1 == true then
    	if not lolbitch then
    	 lolbitch = true
		 doTweenAlpha("hinthii", 'hint', 1, 0.4, 'linear')
     	cancelTween('byehint')
    elseif lolbitch then
		 lolbitch = false
		 doTweenAlpha('byehint', 'hint', 0, 1, 'linear')
     	cancelTween('hinthii')
		end
    end
end

function dodge()
    dcandodge = false
    	dodging = true
		playAnim('boyfriend', 'dodge', true)
		setProperty('boyfriend.specialAnim', true)
    		runTimer('Dodgethecum', 0.67)
		doTweenAngle('weweYES','Warning', 360, 0.3, 'linear')
	doTweenAngle('weweYES2','Warning2', 360, 0.3, 'linear')
end

function onTimerCompleted(tag)
    if tag == 'byewarn' then
		doTweenX('warningcummer3','Warning', -1000, 0.3, 'linear')
		doTweenX('warningcummer32','Warning2', -1000, 0.4, 'linear')
    elseif tag == 'Dodgethecum' and not gameOver then
        dcandodge = true
        dodging = false
	elseif tag == 'botdodge' and not gameOver then
		dodge()
	elseif tag == 'reset' and not gameOver then
		noteTweenAngle('set1', 4, -360, 0.1, 'linear')
		noteTweenAngle('set2', 5, -360, 0.1, 'linear')
		noteTweenAngle('set3', 6, -360, 0.1, 'linear')
		noteTweenAngle('set4', 7, -360, 0.1, 'linear')
	elseif tag == 'waha' then
		playSound('hit', 0.5)
	elseif tag == 'attk' then
		playAnim('mx', 'dodge', true)
		setProperty('mx.specialAnim', true)
    elseif tag == 'dodgetimelol' then
		playSound('bug', 1)
			noteTweenAngle('spin1', 4, 20, 0.3, 'linear')
			noteTweenAngle('spin2', 5, 20, 0.3, 'linear')
			noteTweenAngle('spin3', 6, 20, 0.3, 'linear')
			noteTweenAngle('spin4', 7, 20, 0.3, 'linear')
			runTimer('reset', 0.45)
        if not dodging then
            	setProperty('health', getProperty('health') - 0.85)
				playAnim('boyfriend', 'hurt', true)
				setProperty('boyfriend.specialAnim', true)
				runTimer('waha', 0.2)
        end
    end
end

function opponentNoteHit()
	if hintp1 == true then
			doTweenAlpha('cumonster', 'massiveballs', 0, 1.5,'linear')
			doTweenAlpha('byehint', 'hint', 0, 1, 'linear')
			cancelTween('hinthii')
		hintp1 = false
	end
end

function goodNoteHit()
	if hintp1 == true then
			doTweenAlpha('cumonster', 'massiveballs', 0, 1.5,'linear')
			doTweenAlpha('byehint', 'hint', 0, 1, 'linear')
			cancelTween('hinthii')
		hintp1 = false
	end
end

function noteMiss()
	if hintp1 == true then
			doTweenAlpha('cumonster', 'massiveballs', 0, 1.5,'linear')
			doTweenAlpha('byehint', 'hint', 0, 1, 'linear')
			cancelTween('hinthii')
		hintp1 = false
	end
end