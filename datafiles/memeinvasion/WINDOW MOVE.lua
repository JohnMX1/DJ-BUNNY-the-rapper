-- cool script made by a nice guy#5944
-- pls credit if ur gonna use this in ur mod (im pretty sure no one will use this)

-- this isnt config, dont touch!!!!!!1
local canMoveLeft = true
local canMoveUp = true
local canMoveDown = true
local canMoveRight = true
local shakin = false

-------------- config ---------------
local enabled = true -- pretty self explatory, right?
local bfEnabled = true -- read :)

local windowShakeOnMiss = true -- shakes the window when you miss (only works with bfEnabled!)

local fixed = false -- if the window should move freely or in a fixed position
local windowCenterOnExit = false -- set to true if u want the window to go to the center of ur screen when u exit a song

local offset = 20 -- how many pixels the window moves
local bfOffset = 20 -- same as above, but for bf

local duration = 1 -- duration of the tweens
local bfDuration = 1 -- same as above, but for bf

local ease = 'circOut' -- the tween u want (go to https://haxeflixel.com/demos/FlxTween/ to preview the tweens)
local bfEase = 'circOut' -- same as above, but for bf
----------- end of config -----------



-- this le code
-- touch if you want, i dont mind :)


function onCreatePost()
    luaDebugMode = true
    addHaxeLibrary('Lib', 'openfl')
    desktopX = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.width')
    desktopY = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.height')
    if fixed then
        winY = getPropertyFromClass('openfl.Lib', 'application.window.y')
        winX = getPropertyFromClass('openfl.Lib', 'application.window.x')
    end
end

function onUpdate(elapsed)
    if getPropertyFromClass('openfl.Lib', 'application.window.x') <= 1 then 
        canMoveLeft = false
        cancelTweenWindow('left')
    else
        canMoveLeft = true
    end

    if getPropertyFromClass('openfl.Lib', 'application.window.x') >= (desktopX-getPropertyFromClass('openfl.Lib', 'application.window.width')) then 
        canMoveRight = false
        cancelTweenWindow('right')
    else
        canMoveRight = true
    end

    if getPropertyFromClass('openfl.Lib', 'application.window.y') <= 30 then -- 30 is the window title bar height
        canMoveDown = false
        cancelTweenWindow('down')
    else
        canMoveDown = true
    end

    if getPropertyFromClass('openfl.Lib', 'application.window.y') >= (desktopY-getPropertyFromClass('openfl.Lib', 'application.window.height')) then 
        canMoveUp = false
        cancelTweenWindow('up')
    else
        canMoveUp = true
    end

    --there's probably a better way to do this
    --but idc :p

    if shakin then
        cancelTweenWindow('left')
        cancelTweenWindow('down')
        cancelTweenWindow('up')
        cancelTweenWindow('right')
        setPropertyFromClass('openfl.Lib', 'application.window.y', winY+getRandomInt(-5, 5))
        setPropertyFromClass('openfl.Lib', 'application.window.x', winX+getRandomInt(-5, 5))
    end
end

function goodNoteHit(index, direction, type, sus)
    if not fixed then
        winY = getPropertyFromClass('openfl.Lib', 'application.window.y')
        winX = getPropertyFromClass('openfl.Lib', 'application.window.x')
    end

    if bfEnabled then
        if not sus then
            if direction == 0 and canMoveLeft then
                cancelTweenWindow('right')
                cancelTweenWindow('left')
                doTweenWindow('left' ,'x', winX-bfOffset, bfDuration, bfEase)
            elseif direction == 1 and canMoveUp then
                cancelTweenWindow('down')
                cancelTweenWindow('up')
                doTweenWindow('up' ,'y', winY+bfOffset, bfDuration, bfEase)
            elseif direction == 2 and canMoveDown then
                cancelTweenWindow('up')
                cancelTweenWindow('down')
                doTweenWindow('down' ,'y', winY-bfOffset, bfDuration, bfEase)
            elseif direction == 3 and canMoveRight then
                cancelTweenWindow('left')
                cancelTweenWindow('right')
                doTweenWindow('right' ,'x', winX+bfOffset, bfDuration, bfEase)
            end
        end
    end
end

function opponentNoteHit(index, direction, type, sus)
    if not fixed then
        winY = getPropertyFromClass('openfl.Lib', 'application.window.y')
        winX = getPropertyFromClass('openfl.Lib', 'application.window.x')
    end

    if enabled then
        if not sus then
            if direction == 0 and canMoveLeft then
                cancelTweenWindow('right')
                cancelTweenWindow('left')
                doTweenWindow('left' ,'x', winX-offset, duration, ease)
            elseif direction == 1 and canMoveUp then
                cancelTweenWindow('down')
                cancelTweenWindow('up')
                doTweenWindow('up' ,'y', winY+offset, duration, ease)
            elseif direction == 2 and canMoveDown then
                cancelTweenWindow('up')
                cancelTweenWindow('down')
                doTweenWindow('down' ,'y', winY-offset, duration, ease)
            elseif direction == 3 and canMoveRight then
                cancelTweenWindow('left')
                cancelTweenWindow('right')
                doTweenWindow('right' ,'x', winX+offset, duration, ease)
            end
        end
    end
end


function noteMiss(index, direction, type, sus)
    if bfEnabled and windowShakeOnMiss then
        shakin = true
        runTimer('wait', crochet / 1000)
    end
end

function doTweenWindow(tag, var, value, duration, ease)
    runHaxeCode(tag..' = FlxTween.tween(Lib.application.window, {'..var..': '..value..'}, '..duration..', {ease: FlxEase.'..ease..'})')
end

function cancelTweenWindow(tag)
    runHaxeCode(tag..'.cancel()')
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'wait' then
        shakin = false
    end
end

function onDestroy()
    if enabled then
        if windowCenterOnExit then
            runHaxeCode('FlxTween.tween(Lib.application.window, {y: ((Lib.application.window.display.bounds.height/2)-(Lib.application.window.height/2)-25), x: (Lib.application.window.display.bounds.width/2)-(Lib.application.window.width/2)}, 1, {ease: FlxEase.circOut})')
        end
    end
end





--hi :3