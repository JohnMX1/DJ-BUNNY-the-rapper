
function onEvent(name, value1, value2)
	if name == 'MX Dodge' then
		makeAnimatedLuaSprite('blast', 'blasty', 800, 200);
		scaleObject('blast', 9.0, 9.0);
		addLuaSprite('blast', true);
		luaSpriteAddAnimationByPrefix('blast', 'idle', 'blasty idle', 18, false);
		luaSpriteAddAnimationByPrefix('blast', 'boom', 'blasty blast', 18, false);
		characterPlayAnim(dad, 'JohnMX blue eye', true);
		
		if passed == 1 then
			setObjectX('blast', 800)
		end
		
		if value1 == '1' then
			luaSpritePlayAnimation('blast', 'boom', true)
			doTweenX('blastt', 'blast', 2000, 2.0, 'linear')
			characterPlayAnim(dad, 'go down', true);
		end

		onTweenCompleted('blastt')
			passed = 1;
		end
end