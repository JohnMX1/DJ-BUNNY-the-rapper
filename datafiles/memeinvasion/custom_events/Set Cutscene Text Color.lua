function onEvent(name, value1)
   if name == 'Set Cutscene Text Color' then
     setProperty('cutsceneText.color', getColorFromHex(value1));
   end
end