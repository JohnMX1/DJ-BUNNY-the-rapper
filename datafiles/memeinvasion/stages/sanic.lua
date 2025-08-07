function onCreate()
	-- background shit
	makeLuaSprite('bg', 'sanicbg', -600, -600);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	scaleObject('bg', 2.0, 2.0)

	addLuaSprite('bg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end