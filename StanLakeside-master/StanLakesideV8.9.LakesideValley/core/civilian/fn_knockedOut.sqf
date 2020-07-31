/*
	File: fn_knockedOut.sqf
	
	
	Description:
	Starts and monitors the knocked out state.
*/
params [["_target", ObjNull, [ObjNull]], ["_who", "", [""]], "_obj"];

if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

[format[localize "STR_Civ_KnockedOut",_who], false] spawn domsg;
player playMoveNow "Incapacitated";
player setVariable ["tf_voiceVolume", 0, true];
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
[_obj] spawn {
	params ["_obj"];
	[3] call life_fnc_hudElements;

	if(!(player getVariable["restrained", false]) && !(player getVariable["tied",false])) then {
		player playMoveNow "amovppnemstpsraswrfldnon";
	};

	if(!(player getVariable ["escorting", false])) then {
		detach player;
	};
	deleteVehicle _obj;
	player setVariable["robbed", nil, true];
	player setVariable ["tf_voiceVolume", 1, true];	
};