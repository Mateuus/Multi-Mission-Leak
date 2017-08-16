player setDamage (0.05 + (damage player));
[] call life_fnc_hudUpdate;

hint "Let´s dance !";
sleep 3;

player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
[player,"dance"] call life_fnc_globalSound;
player setDamage (0.05 + (damage player));
[] call life_fnc_hudUpdate;				
		
for "_i" from 0 to 600 do

		{
		
		player setVariable ["drug_pbrau", true, true];
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.01,0.01,true];
		"chromAberration" ppEffectCommit 1;
		sleep 3;

		};
		
"colorInversion" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [0.5,0.5,0.5,0], [0.5,0.5,0.5,0]];
"colorCorrections" ppEffectCommit 10;
waitUntil {ppEffectCommitted "colorCorrections"};
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
player setVariable ["drug_pbrau", false, true];
