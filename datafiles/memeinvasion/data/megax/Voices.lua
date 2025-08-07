SUBX = 35

function onGameOver()

makeLuaText('Subtitle', '', 0, SUBX, -100);
addLuaText('Subtitle', true);
setTextSize('Subtitle', 22);

if getRandomInt(1,6) == 1 then
	
playSound('mx1', 1, 'tag1');

--Subtitle
setTextString('Subtitle', 'My English Is not The Best But At least It IS Better Then You Singing GET OUT OF HERE!');
	
elseif getRandomInt(1,6) == 2 then
	
playSound('mx2', 1, 'tag2');

--Subtitle
setTextString('Subtitle', 'My English Is not The Best But At least It IS Better Then You Singing GET OUT OF HERE!');
SUBX = 150

elseif getRandomInt(1,6) == 3 then
	
playSound('mx3', 1, 'tag3');
	
elseif getRandomInt(1,6) == 4 then
	
playSound('mx4', 1, 'tag4');

elseif getRandomInt(1,6) == 5 then
	
playSound('mx5', 1, 'tag5');

elseif getRandomInt(1,6) == 6 then
	
playSound('mx6', 1, 'tag6');

end
end

function onSoundFinished(tag)

	if tag == 'tag1' then
		setTextString('Subtitle', '');
	end
end