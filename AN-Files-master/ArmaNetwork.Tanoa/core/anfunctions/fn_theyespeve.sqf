_soundArray = ["cokesnort","cokesnortone","cokesnorttwo"];
_soundPicked = selectRandom _soundArray;
drug_level = drug_level + 0.10;
if (drug_level > 1) then { drug_level = 1;};
if(isNil "cocaine_effect") then {cocaine_effect = 0;};
if (cocaine_effect isEqualTo 0) then {
	cocaine_effect = time;
	[] spawn {
		_soundArray = ["cokesnort","cokesnortone","cokesnorttwo"];
		_soundPicked = selectRandom _soundArray;
		[player,_soundPicked,20] remoteExecCall ["life_fnc_quvucamaph",-2];
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1.5, 0.5, [0,0,0,0], [0.2,0.2,0.2,0.5], [1,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [drug_level/10,drug_level/10,true];
		"chromAberration" ppEffectCommit 1;
		player setFatigue 0;
		player enableFatigue false;
		player setVariable ["drug_cocaine",true,true];
		waitUntil {!alive player || ((time - cocaine_effect) > (3 * 60))};
		"chromAberration" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
		player setVariable ["drug_cocaine",nil,true];
		player enableFatigue true;
		cocaine_effect = nil;
	};
};

cocaine_effect = time;
