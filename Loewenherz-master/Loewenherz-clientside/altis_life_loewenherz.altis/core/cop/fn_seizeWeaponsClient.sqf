/*
	File: fn_seizeWeaponsClient.sqf
	Author: Ciaran Langton,Blackd0g

	Description:
	"Seizes" the weapons
*/
private["_unit"];
_unit = param [0,objNull,[objNull]];
_mode = param [1,false,[false]];
if(isNull _unit) exitWith {};
if(side _unit != west) exitWith {};

if ((headgear player) in ["H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan"]) then {
	removeHeadgear player;
};

if(_mode) then {
	if(primaryWeapon player == "") exitWith {[[0,"Es wurde keine Primärwaffe gefunden!"],"lhm_fnc_broadcast",_unit,false] call lhm_fnc_mp;};

	player removeWeapon (primaryWeapon player); //Remove that primary!
	[[0,"Removed primary weapon from player!"],"lhm_fnc_broadcast",_unit,false] call lhm_fnc_mp;
} else {
	if(handgunWeapon player == "") exitWith {[[0,"Es wurde keine Handfeuerwaffe gefunden!"],"lhm_fnc_broadcast",_unit,false] call lhm_fnc_mp;};
	player removeWeapon (handgunWeapon player); //Remove that handgun!
	[[0,"Removed handgun from player!"],"lhm_fnc_broadcast",_unit,false] call lhm_fnc_mp;
};

[] call SOCK_fnc_updateRequest;