_soundArray = ["weedjoint","weedjointone"];
_soundPicked = selectRandom _soundArray;
drug_level = drug_level + 0.10;
if (drug_level > 1) then {drug_level = 1;};
if(isNil "weed_effect") then {weed_effect = 0;};
if (weed_effect isEqualTo 0) then {
	weed_effect = time;
	[] spawn {
		_soundArray = ["weedjoint","weedjointone"];
		_soundPicked = selectRandom _soundArray;
		[player,_soundPicked,20] remoteExecCall ["life_fnc_quvucamaph",-2];
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1.5, 0.5, [0,0,0,0], [0.2,0.2,0.2,0.5], [1,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [drug_level/10,drug_level/10,true];
		"chromAberration" ppEffectCommit 1;
		_OBJ = player;
		_PS = "#particlesource" createVehicle getpos _OBJ;
		[_PS,_OBJ] remoteExec ["life_fnc_fudrumavaph",-2];
		player setVariable ["drug_weed",true,true];
		waitUntil {!alive player || ((time - weed_effect) > (2 * 60))};
		"chromAberration" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
		player setVariable ["drug_weed",nil,true];
		deleteVehicle _PS;
		weed_effect = nil;
	};
};

weed_effect = time;
