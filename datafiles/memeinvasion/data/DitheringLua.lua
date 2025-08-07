function onCreate()
	initLuaShader('dither')
	
    makeLuaSprite("grapshad")
    makeGraphic("grapshad", screenWidth, screenHeight)
    setSpriteShader("grapshad", 'dither')
    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
		var game = PlayState.instance;
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("grapshad").shader)]);
    ]])  
end