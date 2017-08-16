
/*
	File: fn_knockedOut.sqf
	Author: Blackd0g

	Description:
	Starts and monitors the knocked out state.
*/
private ["_who","_obj","_chance","_inLOS","_knockOutSounds","_sound","_effect","_chancePercent"];
_target = param [0,ObjNull,[ObjNull]];
_who = param [1,"",[""]];
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who isEqualTo "") exitWith {};
_chance = false;
_chancePercent = 0;

// check if target was in line of sight
_inLOS = [_target,player] call lhm_fnc_LoSCheck;

if(_inLOS) then {
	_chancePercent = 35;
	_chancePercent = _chancePercent - (speed player);
	if(_chancePercent < 0) then {_chancePercent = 0};
	_chance = _chancePercent > random 100; // 35% chance
} else {
	_chancePercent = 85;
	_chancePercent = _chancePercent - (speed player);
	if(_chancePercent < 0) then {_chancePercent = 0};
	_chance = _chancePercent > random 100; // 85% chance
};

if (player getVariable "restrained") then // always true if restrained
{
	_chance = true;
};

if (_chance) then {
	titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
	[(5 + round random 10)] spawn lhm_fnc_bulletHit;
	player playMoveNow "Incapacitated";

	_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
	_obj setPosATL (getPosATL player);
	player setFatigue 1;

	player setDamage (damage player + (random 0.1)); // get some damage...

	[[player,"man_cry"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;

	player attachTo [_obj,[0,0,0]];
	for "_i" from 1 to 15 step 1 do
	{
		playSound "heartbeat_1";
		Uisleep 1;
	};

	player playMoveNow "amovppnemstpsraswrfldnon";
	detach player;
	deleteVehicle _obj;

	player setVariable["robbed",FALSE,TRUE];
} else {
	titleText[format["Du wurdest von %1 geschlagen...",_who],"PLAIN"];
	[(5 + round random 5)] spawn lhm_fnc_bulletHit;

	_effect = [["scream_short_0"],["scream_short_1"],["scream_short_2"],["scream_short_3"],["scream_short_4"]] call BIS_fnc_selectRandom select 0;
	[[player,_effect],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;

	 player setFatigue (getFatigue player + (random 0.5));
	 if(getFatigue player > 0.6) then {
	 	0 fadeSound 0;
	 	3 fadeSound 1;
	 };
};