_soundArray = ["mushroom","mushroomone"];
_soundPicked = selectRandom _soundArray;
drug_level = drug_level + 0.10;
if (drug_level > 1) then { drug_level = 1;};
if(isNil "mushroom_effect") then {mushroom_effect = 0;};
if (mushroom_effect isEqualTo 0) then {
	mushroom_effect = time;
	[] spawn {
		//playSound _soundPicked;
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1.5, 0.5, [0,0,0,0], [0.2,0.2,0.2,0.5], [1,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [drug_level/10,drug_level/10,true];
		"chromAberration" ppEffectCommit 1;
		player setVariable ["drug_mushroom",true,true];
		waitUntil {!alive player || ((time - mushroom_effect) > (3 * 60))};
		"chromAberration" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
		player setVariable ["drug_mushroom",nil,true];
		mushroom_effect = nil;
	};
};
mushroom_effect = time;
