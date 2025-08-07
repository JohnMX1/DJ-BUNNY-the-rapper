local enemyPlay=false
local singAnims={'singLEFT','singDOWN','singUP','singRIGHT'}
local exceptionNotes={'No Animation', 'GF Sing'}

function swapBool(var) --made this thing cuz earlier vers of psych get picky with "not" for some reason
	if var then
		return false;
	else
		return true;
	end
end

function swapNotes(bool) --swaps the notes n shit
	for laterNotes = 0, getProperty('unspawnNotes.length')-1 do
		setPropertyFromGroup('unspawnNotes', laterNotes, 'noAnimation', bool)
		if not getPropertyFromGroup('unspawnNotes', laterNotes, 'mustPress')==bool then --Check
			setPropertyFromGroup('unspawnNotes', laterNotes, 'mustPress', bool) --Set
		else
			setPropertyFromGroup('unspawnNotes', laterNotes, 'mustPress', swapBool(bool)) --Set
		end
	end
		
	for curNotes = 0, getProperty('notes.length')-1 do
		setPropertyFromGroup('notes', curNotes, 'noAnimation', bool)
		if not getPropertyFromGroup('notes', curNotes, 'mustPress')==bool  then --Check
			setPropertyFromGroup('notes', curNotes, 'mustPress', bool) --Set
		else
			setPropertyFromGroup('notes', curNotes, 'mustPress', swapBool(bool)) --Set
		end
	end
end

function swapStrums(fuck) --swaps the strums
	local pos={
		[true]={		
			[0]=defaultPlayerStrumX0,
			[1]=defaultPlayerStrumX1,
			[2]=defaultPlayerStrumX2,
			[3]=defaultPlayerStrumX3,
			[4]=defaultOpponentStrumX0,
			[5]=defaultOpponentStrumX1,
			[6]=defaultOpponentStrumX2,
			[7]=defaultOpponentStrumX3,
		},
		[false]={		
			[0]=defaultOpponentStrumX0,
			[1]=defaultOpponentStrumX1,
			[2]=defaultOpponentStrumX2,
			[3]=defaultOpponentStrumX3,
			[4]=defaultPlayerStrumX0,
			[5]=defaultPlayerStrumX1,
			[6]=defaultPlayerStrumX2,
			[7]=defaultPlayerStrumX3,
		}
	}
	for aaa=0,7 do
		noteTweenX('swapStrums'..aaa, aaa, pos[fuck][aaa], 0.25, 'circOut')
	end
end

function onEvent(tag,v1,v2)
	if n=='EnemyPlay' then
		if v1==true then
			swapStrums(true)
			swapNotes(true)
			enemyPlay=true
		else
			swapStrums(false)
			swapNotes(false)
			enemyPlay=false
		end
	end
end

function opponentNoteHit(id,dir,note,sus)
	if enemyPlay and not exceptionNotes[note] then
		characterPlayAnim('boyfriend', singAnims[dir+1], true)
		setProperty('boyfriend.holdTimer', 0)
	end
end

function goodNoteHit(id,dir,note,sus)
	if enemyPlay and not exceptionNotes[note] then
		characterPlayAnim('dad', singAnims[dir+1], true)
		setProperty('dad.holdTimer', 0)
		if getProperty('health')>0.1 then addHealth(-0.02) end --YOU MUS DIE
	end
end

function noteMiss(id, dir, note, sus)
	if enemyPlay then
		triggerEvent('Play Animation', singAnims[dir+1]..'miss', 'dad')
		addHealth(0.04)
		if getProperty('health')==2 then addHealth(-10) end --YOU MUS DIE but not really
	end	
end

function noteMissPess(dir)
	if enemyPlay then
		triggerEvent('Play Animation', singAnims[dir+1]..'miss', 'dad')
		addHealth(0.04)
		if getProperty('health')==2 then addHealth(-10) end --YOU MUS DIE but not really
	end
end