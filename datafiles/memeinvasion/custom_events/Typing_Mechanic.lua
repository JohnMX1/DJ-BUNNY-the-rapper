words = {'UI', 'DANCA GATINHO', 'CAVALO', 'ELE E CALVO', 'VAI SE FUDER HULKBR', 'MACUMBA SARAIVA SOLTA PEIDO SAI FUBA', 'OURO', 'SILVER', 'DONT BELONG', 'ABANDONED', 'BOO!', 'UNOWN', 'NOT WANTED', 'TIRESOME', 'USELESS', 'GRUESOME', 'NIGHTMARE', 'GET OUT', 'HOPELESS', 'RUN', 'NOT WELCOME', 'CAN YOU SEE?', 'WHERE?', 'HELP', 'RELIVE', 'XXXXX', 'GOODBYE', 'CELEBI DIED', 'IT FAILED', 'AGONY', 'I SEE YOU', 'NICE COCK LET ME LICK AND SUCK IT'}
wordCount = 32
stringToType = ""

function onCreate()
  debugPrint(wordCount)
end

function onUpdate()
  if stringToType ~= "" then
    setTextString('string', stringToType)
    setTextString('string2', timeRemaining)
    letterToType = string.sub(stringToType, 1, 1)
    if letterToType == " " then
      stringToType = string.sub(stringToType, 2, -1)
      letterToType = string.sub(stringToType, 1, 1)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.' .. string.upper(letterToType)) then
      stringToType = string.sub(stringToType, 2, -1)
    end
  end

  if stringToType == "" then
    removeLuaSprite('redness', false)
    removeLuaText('string', false)
    removeLuaText('string2', false)
  end
end

function onEvent(tag, e1, e2)
  if tag == 'Typing Mechanic' then
    makeLuaSprite('redness', "", -1000, -1000)
    makeGraphic('redness', 4000, 4000, 'ff5555')
    setProperty('redness.alpha', 0.5)
    addLuaSprite('redness', true)
    setObjectCamera('redness', 'camHUD')
    math.randomseed(os.clock())
    numberToType = math.random(1,wordCount)
    stringToType = words[numberToType]
    timeRemaining = 5
    runTimer('Timer Tick', 1)
    makeLuaText('string', stringToType, 1280, 0, 250)
    screenCenter('string', 'x')
    setTextSize('string', 100)
    setTextFont('string', 'PokemonGB.ttf')
    addLuaText('string')

    makeLuaText('string2', timeRemaining, 1280, 0, 500)
    screenCenter('string2', 'x')
    setTextSize('string2', 60)
    setTextFont('string2', 'PokemonGB.ttf')
    addLuaText('string2')
  end
end

function onStepHit()
end

function onTimerCompleted(tag)
  if tag == 'Timer Tick' then
    if stringToType ~= "" then
      timeRemaining = timeRemaining - 1 
      if timeRemaining == 0 then
	setProperty('health', 0)
      end
      runTimer('Timer Tick', 1)
    end
  end
end