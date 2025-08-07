function onCreatePost()
   makeLuaText('cutsceneText', 'Fuck you.', getPropertyFromClass('flixel.FlxG', 'width') - 100, 0, 595);
   setObjectCamera('cutsceneText', 'camOther');
   screenCenter('cutsceneText', 'x');
   setTextFont('cutsceneText', 'prstartk.ttf');
   setTextAlignment('cutsceneText', 'center');
   setTextSize('cutsceneText', 19);
   setProperty('cutsceneText.alpha', 0);
   setProperty('cutsceneText.antialiasing', false);
   setObjectOrder('cutsceneText', getObjectOrder('bottomBar') + 1);
   addLuaText('cutsceneText');
end

   
function onEvent(name, value1, value2)
   if name == 'Cutscene Text' then
      cancelTween('textFadeIn');
	  cancelTimer('visibleTime');
   
      setProperty('cutsceneText.alpha', 0);
      doTweenAlpha('textFadeIn', 'cutsceneText', 1, 0.3, 'quadInOut');
	  
      setTextString('cutsceneText', value1);
	  
	  runTimer('visibleTime', tonumber(value2), 1);
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'visibleTime' then
      doTweenAlpha('textFadeOut', 'cutsceneText', 0, 0.3, 'quadInOut');
   end
end