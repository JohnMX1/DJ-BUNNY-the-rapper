songended = false
function onUpdatePost()

    if songended == false then

    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Vs Meme Invasion 1.0 | '..'Song: '..getProperty('curSong')..' | '..getProperty('scoreTxt.text'))

    end

end

function onDestroy()

    songended = true

    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Psych Engine 0.6.3: Vs Meme Invasion 1.0 ')

end

function onGameOver()

    songended = true

    setPropertyFromClass('lime.app.Application', 'current.window.title', 'Psych Engine 0.6.3: Vs Meme Invasion 1.0 |'..' Song: '..getProperty('curSong')..' | Game Over')

    return Function_Continue

end