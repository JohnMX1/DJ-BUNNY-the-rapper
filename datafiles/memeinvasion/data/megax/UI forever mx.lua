SNUIXUP = 350 -- 350
SNUIYUP = -0 -- 0

SNUIXDOWN = 350 -- 350
SNUIYDOWN = 675 -- 675

function onCreate()
    --UI SHIT--
    if downscroll == false then
        makeLuaText('SongNameUI', '', 0, SNUIXUP, SNUIYUP);
    else
        makeLuaText('SongNameUI', '', 0, SNUIXDOWN, SNUIYDOWN);
    end
    setTextAlignment('SongNameUI', 'center');
    setTextSize('SongNameUI', 30);
    addLuaText('SongNameUI', true);
    setTextAlignment('SongNameUI', 'center');

    makeLuaText('EngineTextLol', 'Psych Engine v'..version, 0, 706, 0);
    addLuaText('EngineTextLol', true)
    setTextSize('EngineTextLol', 22);

    makeLuaText('ModTextLol', 'Vs Meme Invasion 1.0 v1.0', 0, 650, 20);
    addLuaText('ModTextLol', true)
    setTextSize('ModTextLol', 20);

    makeLuaText('FnfTextLol', 'Friday Night Funkin (Where Is Week 8?)', 0, 540, 40);
    addLuaText('FnfTextLol', true)
    setTextSize('FnfTextLol', 18);

    makeLuaSprite('log', 'logo', 738, 585);
    scaleObject('log', 0.3, 0.3);
    addLuaSprite('log', true);
    setObjectCamera('log', 'camother');  
end

function onUpdate()
    setTextString('SongNameUI', '- '..songName..' ['..difficultyName..'] -');
end