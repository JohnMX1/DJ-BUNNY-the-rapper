function onStartCooldown()
    if (botPlay) then
        -- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
            setProperty('inCutscene', true);
            callOnLuas('unlockAchievement', {"Play The Cover Of Fight Or Flight", getPropertyFromClass('Paths', 'currentModDirectory'), false})
            runTimer('endSongFromAchievement', 4)
            return Function_Stop;
        end
    end
    return Function_Continue;
end
