function onCreate()
	-- background shit
	makeLuaSprite('bg', 'johnmx/bak', -1000, -1500);
	setLuaSpriteScrollFactor('bg', 2.2, 2.2);
	scaleObject('bg', 3.0, 3.0);

	makeLuaSprite('sol', 'johnmx/sol', -100, -50);
	setLuaSpriteScrollFactor('sol', 0, 0);
	scaleObject('sol', 1.1, 1.1);	

	makeLuaSprite('gr', 'johnmx/grass', -800, -100);
	setLuaSpriteScrollFactor('gr', 1.5, 1.5);
	scaleObject('gr', 1.5, 1.5);

	makeLuaSprite('ground', 'johnmx/chao', -400, -150);
	setLuaSpriteScrollFactor('ground', 0.9, 0.9);
	scaleObject('ground', 1.1, 1.1);

	makeLuaSprite('tree', 'johnmx/tree', 200, -100);
	setLuaSpriteScrollFactor('no', 0.9, 0.9);
	scaleObject('tree', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

	end

	addLuaSprite('bg', false);
	addLuaSprite('sol', false);
	addLuaSprite('gr', false);
	addLuaSprite('ground', false);
	addLuaSprite('tree', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end