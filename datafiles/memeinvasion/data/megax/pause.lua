-- this was made by my_life101#7445 on discord btw
--no stealing 🥺
--script ver 1

local Paused = false
local resume = true
local restart = false
local quit = false

function onCreate()
	makeLuaSprite('black', 'stageback', -600, -300);
	makeGraphic('black',2560,1400,'000000');
	screenCenter('black');
    addLuaSprite('black',true);
    setProperty('black.alpha',0.5);
    setObjectCamera('black', 'other');
    makeLuaSprite('bfport',boyfriendName,10,0)
    addLuaSprite('bfport',true)
    setObjectCamera('bfport','other')
    makeLuaSprite('dadport',dadName,1000,0)
    addLuaSprite('dadport',true)
    setObjectCamera('dadport','other')
	makeLuaSprite('box', 'pausebox/pausebox', 420, 20);
    addLuaSprite('box',true);
    setObjectCamera('box', 'other');
    scaleObject('box',0.4,0.4)
    makeLuaSprite('arrow','pausebox/pausearrow',460, 20)
    addLuaSprite('arrow',true)
    setObjectCamera('arrow','other')
    scaleObject('arrow',0.4,0.4)
    doTweenAngle('turntween','arrow',-90,0.1,'linear')
    makeLuaText('resume', 'Resume', 0, 500, 60);
    makeLuaText('restart', 'Restart', 0, 500, 115);
    makeLuaText('quit', 'Quit', 0, 500, 170);
    setTextSize('resume', 30);
    setTextSize('restart', 30);
    setTextSize('quit', 30);
    setObjectCamera('resume', 'other');
    setObjectCamera('restart', 'other');
    setObjectCamera('quit', 'other');
    setObjectCamera('songname', 'other');
    setTextFont('resume', 'PokemonGB.TTF')
    setTextFont('restart', 'PokemonGB.TTF')
    setTextFont('quit', 'PokemonGB.TTF')
    setTextFont('songname', 'PokemonGB.TTF')
    setTextFont('diff', 'PokemonGB.TTF')
    setTextFont('bptext', 'PokemonGB.TTF')
    setTextColor('resume', '000000')
    setTextColor('restart', '000000')
    setTextColor('quit', '000000')
    setTextBorder('resume',0)
    setTextBorder('restart',0)
    setTextBorder('quit',0)
end

function onUpdatePost()
	if Paused == true then
		setPropertyFromClass('Conductor', 'songPosition', pos) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', pos)
		setProperty('vocals.time', pos)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
		setProperty("boyfriend.animation.curAnim.paused", true)
		setProperty("dad.animation.curAnim.paused", true)
		setProperty("gf.animation.curAnim.paused", true)
		setProperty("playerStrums.animation.curAnim.paused", true)
		setProperty("boyfriend.heyTimer", 0)
		setProperty("dad.heyTimer", 0)
		setProperty("gf.heyTimer", 0)
        setProperty('black.visible', true)
        setProperty('box.visible', true)
        setProperty('arrow.visible', true)
        addLuaText('resume')
        addLuaText('restart')
        addLuaText('quit')
        addLuaText('songname')
        setProperty('bfport.visible',true)
        setProperty('dadport.visible',true)
	else
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		setProperty('vocals.volume', 1)
		setProperty('dad.animation.curAnim.paused', false)
		setProperty('gf.animation.curAnim.paused', false)
		setProperty('boyfriend.animation.curAnim.paused', false)
		setProperty("playerStrums.animation.curAnim.paused", false)
        setProperty('black.visible', false)
        setProperty('box.visible', false)
        setProperty('arrow.visible', false)
        removeLuaText('resume',false)
        removeLuaText('restart',false)
        removeLuaText('quit',false)
        setProperty('bfport.visible',false)
        doTweenX('bfportfix','bfport',1000,0.01,'linear')
        setProperty('dadport.visible',false)
        doTweenX('dadportfix','dadport',-500,0.01,'linear')
		end
    


        if resume == true then
            doTweenY('arrowmove','arrow',60,0.001,'linear')
        end
        if restart == true then
            doTweenY('arrowmove','arrow',115,0.001,'linear')
        end
        if quit == true then
            doTweenY('arrowmove','arrow',170,0.001,'linear')
        end

        if keyJustPressed ('up') and Paused == true then
            if resume == true then
                quit = true
                resume = false
            elseif restart == true then
                resume = true
                restart = false
            elseif quit == true then
                restart = true
                quit = false
            end
        end
        if keyJustPressed ('down') and Paused == true then
            if resume == true then
                resume = false
                restart = true 
            elseif restart == true then
                restart = false
                quit = true
            elseif quit == true then
                quit = false
                resume = true
            end
        end
    end

function onPause()
    if restart == true then
        restartSong(false);
    end
    if quit == true then
        exitSong(false);
    end
    Paused = not Paused
    pos = getPropertyFromClass('Conductor', 'songPosition')
	return Function_Stop
end
function onEvent(N, chartype, char)
    if N == 'Change Character' then
        if chartype == 'gf' then
        elseif chartype == 'bf' then
            removeLuaSprite('bfport', true)
        elseif chartype == 'dad' then
            removeLuaSprite('dadport',true)
        end
    end
end

function onTweenCompleted(T)
    if T == 'bfportfix' then
        doTweenX('bfportslide','bfport',250,0.4,'circInOut')
    end
    if T == 'dadportfix' then
        doTweenX('dadportslide','dadport',-10,0.4,'circInOut')
    end
end
