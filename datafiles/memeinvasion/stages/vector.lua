function onCreate()
	-- background shit
	makeLuaSprite('gray', 'vituae/gray', -600, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	scaleObject('gray', 2.0, 2.0);
	
	makeLuaSprite('white', 'vituae/whitewall', -600, -300);
	setLuaSpriteScrollFactor('white', 0.9, 0.9);
	scaleObject('white', 2.0, 2.0);

	makeLuaSprite('sus', 'vituae/sus-ok', 0, -150);
	setLuaSpriteScrollFactor('sus', 0.9, 0.9);
	scaleObject('sus', 1.1, 1.1);

	makeLuaSprite('floor', 'vituae/floor', -390, -300);
	setLuaSpriteScrollFactor('floor', 0.9, 0.9);
	scaleObject('floor', 1.1, 1.1);

	makeLuaSprite('wall', 'vituae/wall', -360, -300);
	setLuaSpriteScrollFactor('wall', 0.9, 0.9);
	scaleObject('wall', 1.1, 1.1);
	setObjectCamera('wall', 'camGame');
	setObjectOrder('wall', 4);

	makeLuaSprite('hand', 'vituae/hand', -390, -50);
	setLuaSpriteScrollFactor('hand', 0.9, 0.9);
	setObjectCamera('hand', 'camGame');
	setObjectOrder('hand', 5);

	makeAnimatedLuaSprite('me', 'vituae/me', -360, -100);
	setLuaSpriteScrollFactor('me', 0.9, 0.9);
	scaleObject('me', 1.1, 1.1);
	luaSpriteAddAnimationByPrefix('me', 'idle', 'me idle', 8, true);
	setObjectCamera('me', 'camGame');
	setObjectOrder('me', 3);
	setObjectOrder('dadGroup', 2)

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end

	addLuaSprite('gray', false);
	addLuaSprite('white', false);
	addLuaSprite('floor', false);
	addLuaSprite('me', false);
	addLuaSprite('wall', false);
	addLuaSprite('sus', false);
	addLuaSprite('hand', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end