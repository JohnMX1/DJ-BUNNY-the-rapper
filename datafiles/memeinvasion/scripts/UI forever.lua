SNUIXUP = 485 -- 485
SNUIYUP = -0 -- 0

SNUIXDOWN = 475 -- 475
SNUIYDOWN = 675 -- 675

-- sx = x scale and sy = y scale

function onCreate()
    --UI SHIT--
    if downscroll == false then
        makeLuaText('SongNameUI', '', 0, SNUIXUP, SNUIYUP);
    else
        makeLuaText('SongNameUI', '', 0, SNUIXDOWN, SNUIYDOWN);
    end
    setTextAlignment('SongNameUI', 'right');
    setTextSize('SongNameUI', 30);
    addLuaText('SongNameUI', true);

    makeLuaText('EngineTextLol', 'Psych Engine v'..version, 0, 1025, 0);
    addLuaText('EngineTextLol', true)
    setTextSize('EngineTextLol', 22);

    makeLuaText('ModTextLol', 'Vs Meme Invasion 1.0', 0, 1035, 20);
    addLuaText('ModTextLol', true)
    setTextSize('ModTextLol', 20);

    makeLuaText('FnfTextLol', 'Friday Night Funkin ', 0, 1065, 40);
    addLuaText('FnfTextLol', true)
    setTextSize('FnfTextLol', 18); 

    makeLuaSprite('log', 'logo', 1065, 585);
    scaleObject('log', 0.3, 0.3);
    addLuaSprite('log', true);
    setObjectCamera('log', 'camOther');  
end

function onUpdate()
    setTextString('SongNameUI', '- '..songName..' ['..difficultyName..'] -');
end