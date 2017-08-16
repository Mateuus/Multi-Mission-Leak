/*
	File: fn_heroin.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Say hello to my little friend!
*/

if (!([false,"heroinp",1] call life_fnc_handleInv)) exitWith {};

life_drug_level = life_drug_level + 0.10;
if (life_drug_level > 1) then { life_drug_level = 1; };
[] call life_fnc_hudUpdate;

if (life_heroin_effect == 0) then
{
	life_heroin_effect = time;
	[] spawn
	{
		systemChat "You feel terrific!";
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1.5, 0.5, [0,0,0,0], [0.2,0.2,0.2,0.5], [1,0,0,0]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [life_drug_level / 10,life_drug_level / 10,true];
		"chromAberration" ppEffectCommit 1;
		
		waitUntil {!alive player || ((time - life_heroin_effect) > (4 * 60))};
		
		"chromAberration" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
		life_heroin_effect = 0;
	};
};

life_heroin_effect = time;

["heroinp"] call life_fnc_drugUsed;