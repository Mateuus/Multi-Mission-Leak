#include "..\..\script_macros.hpp"
/*
fn_radArea.sqf

Created by Fuel for RebornRoleplay.com

[UK/EU] Reborn Roleplay | RebornRoleplay.co.uk
*/
private ["_player"];

_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_damage = getDammage _player;
_uniform = uniform _player;
_vest = vest _player;
_headgear = headgear _player;
_rad1 = ppEffectCreate ["ChromAberration",200];
_rad2 = ppEffectCreate ["DynamicBlur",500];
_rad3 = ppEffectCreate ["FilmGrain",2000];

if (!alive _player || (_damage == 1) || (_player getVariable ["exitRad",true])) exitWith {

	_player setVariable ["exitRad",true];
	_rad1 ppEffectEnable false;
	_rad1 ppEffectAdjust [0,0,true];
	_rad1 ppEffectCommit 1;
	_rad2 ppEffectEnable false;
	_rad2 ppEffectAdjust [0];
	_rad2 ppEffectCommit 1;
	_rad3 ppEffectEnable false;
	_rad3 ppEffectAdjust [0,0,0,0,0,true];
	_rad3 ppEffectCommit 1;};

// this is the check to see if they are wearing protective clothing
if (_uniform isEqualTo "U_C_Scientist") then {

//rad sound
	_player say2d "rad";

// edit this for the length of the effect
	for "_i" from 0 to 4 do {
	_rad1 ppEffectEnable true;
	_rad1 ppEffectAdjust [-0.02,0,true];
	_rad1 ppEffectCommit 1;
	_rad2 ppEffectEnable true;
	_rad2 ppEffectAdjust [0.03];
	_rad2 ppEffectCommit 1;
	_rad3 ppEffectEnable true;
	_rad3 ppEffectAdjust [0.12,1.52,3.54,2,2,true];
	_rad3 ppEffectCommit 1;
};
	sleep 5;

//loops the script until they exit
	[_player] remoteExec ["life_fnc_radArea",_player];

} else {

//rad sound
	_player say2d "rad";

// edit this for the length of the effect
	for "_i" from 0 to 4 do {
	_rad1 ppEffectEnable true;
	_rad1 ppEffectAdjust [-0.02,0,true];
	_rad1 ppEffectCommit 1;
	_rad2 ppEffectEnable true;
	_rad2 ppEffectAdjust [0.03];
	_rad2 ppEffectCommit 1;
	_rad3 ppEffectEnable true;
	_rad3 ppEffectAdjust [0.12,1.52,3.54,2,2,true];
	_rad3 ppEffectCommit 1;
};
	sleep 5;

//set the damage to player
	_player setDamage (_damage + 0.1);

//loops the script until they exit
	[_player] remoteExec ["life_fnc_radArea",_player];
};
