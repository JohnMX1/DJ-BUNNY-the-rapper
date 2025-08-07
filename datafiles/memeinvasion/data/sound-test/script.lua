--Go to line 151 for instructions
function onCreate()
	CodeOne = 00;
	CodeTwo = 00;
	selectedCode = 'One';
	setProperty('camHUD.visible', false);

	makeLuaSprite('nt', 'blackscreen', 0, 0)
	setObjectCamera('nt', 'other')
	scaleObject('nt', 10, 10)
	addLuaSprite('nt', true)

	makeLuaText('text1', 'Welcome To The Sound Test', 0, 0, 350)
	setTextAlignment('text1', 'center')
	setTextSize('text1', 35)
	setObjectCamera('text1', 'other')
	addLuaText('text1')

	makeLuaText('text2', 'Press the arrow keys on your keyboard to make a code', 0, 0, 400)
	setTextAlignment('text2', 'center')
	setTextSize('text2', 35)
	setObjectCamera('text2', 'other')
	addLuaText('text2')

	makeLuaText('text5', 'After inserting the code, press Enter on your keyboard', 0, 0, 450)
	setTextAlignment('text5', 'center')
	setTextSize('text5', 35)
	setObjectCamera('text5', 'other')
	addLuaText('text5')

	makeLuaText('text6', 'Press Backspace to exit', 0, 0, 500)
	setTextAlignment('text6', 'center')
	setTextSize('text6', 35)
	setObjectCamera('text6', 'other')
	addLuaText('text6')

	makeLuaText('num1', CodeOne, 0, 700, 550)
	setTextAlignment('num1', 'center')
	setTextSize('num1', 50)
	setObjectCamera('num1', 'other')
	addLuaText('num1')

	makeLuaText('num2', CodeTwo, 0, 760, 550)
	setTextAlignment('num2', 'center')
	setTextSize('num2', 50)
	setObjectCamera('num2', 'other')
	addLuaText('num2')

	makeLuaText('under1', '__', 0, 700, 560)
	setTextAlignment('under1', 'center')
	setTextSize('under1', 50)
	setObjectCamera('under1', 'other')
	addLuaText('under1')

	makeLuaText('under2', '__', 0, 760, 560)
	setTextAlignment('under2', 'center')
	setTextSize('under2', 50)
	setObjectCamera('under2', 'other')
	addLuaText('under2')

	if CodeOne < 10 then
		CodeOne = '0' .. CodeOne;
	end
	if CodeTwo < 10 then
		CodeTwo = '0' .. CodeTwo;
	end
	setProperty('skipCountdown', true);
end

function onUpdate(elapsed)
	setTextString('num1', CodeOne)
	setTextString('num2', CodeTwo)

	if selectedCode == 'One' then
		setTextColor('num1', 'ffc800')
		setTextColor('num2', 'ffffff')
		setTextColor('under1', 'ffc800')
		setTextColor('under2', 'ffffff')
	elseif selectedCode == 'Two' then
		setTextColor('num2', 'ffc800')
		setTextColor('num1', 'ffffff')
		setTextColor('under2', 'ffc800')
		setTextColor('under1', 'ffffff')
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
		if selectedCode == 'One' then
			CodeOne = CodeOne+1;
			if CodeOne > 50 then
				CodeOne = 0;
				if CodeOne < 10 then
					CodeOne = '0' .. CodeOne;
				end
			elseif CodeOne < 0 then
				CodeOne = 50;
			elseif CodeOne < 10 then
				CodeOne = '0' .. CodeOne;
			end
		elseif selectedCode == 'Two' then
			CodeTwo = CodeTwo+1;
			if CodeTwo > 50 then
				CodeTwo = 0;
				if CodeTwo < 10 then
					CodeTwo = '0' .. CodeTwo;
				end
			elseif CodeTwo < 0 then
				CodeTwo = 50;
			elseif CodeTwo < 10 then
				CodeTwo = '0' .. CodeTwo;
			end
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
		if selectedCode == 'One' then
			CodeOne = CodeOne-1;
			if CodeOne > 50 then
				CodeOne = 0;
				if CodeOne < 10 then
					CodeOne = '0' .. CodeOne;
				end
			elseif CodeOne < 0 then
				CodeOne = 50;
			elseif CodeOne < 10 then
				CodeOne = '0' .. CodeOne;
			end
		elseif selectedCode == 'Two' then
			CodeTwo = CodeTwo-1;
			if CodeTwo > 50 then
				CodeTwo = 0;
				if CodeTwo < 10 then
					CodeTwo = '0' .. CodeTwo;
				end
			elseif CodeTwo < 0 then
				CodeTwo = 50;
			elseif CodeTwo < 10 then
				CodeTwo = '0' .. CodeTwo;
			end
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
		if selectedCode == 'One' then
			selectedCode = 'Two'
		elseif selectedCode == 'Two' then
			selectedCode = 'One'
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
		if selectedCode == 'One' then
			selectedCode = 'Two'
		elseif selectedCode == 'Two' then
			selectedCode = 'One'
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
		--Here you put the codes, if you choose a number from 0 to 9 then put '09' or '01' or depending on the number
		--When the number is 10 to 50 however, put the number normally without ''
		--All assets you need are in the zip file
		if CodeOne == 11 and CodeTwo == 11 then
			playSound('notDeniedMOMENT', 1, 'notDeniedMOMENT')
			loadSong('test', 'hard')
		elseif CodeOne == 20 and CodeTwo == 11 then
			playSound('notDeniedMOMENT', 1, 'notDeniedMOMENT')
			loadSong('troublemaker' 'hard')
		elseif CodeOne == 19 and CodeTwo == '00' then
			playSound('notDeniedMOMENT', 1, 'notDeniedMOMENT')
			loadSong('kasca' 'hard')
		elseif CodeOne == 31 and CodeTwo == 13 then
			playSound('notDeniedMOMENT', 1, 'notDeniedMOMENT')
			loadSong('mist' 'hard')
		elseif CodeOne == 13 and CodeTwo == 22 then
			playSound('notDeniedMOMENT', 1, 'notDeniedMOMENT')
			loadSong('voting' 'hard')
		else
			playSound('deniedMOMENT', 1, 'deniedMOMENT')
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.BACKSPACE') then
		endSong()
	end
end

function onPause()
	return Function_Stop;
end