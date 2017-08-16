/*
	File:
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,EMonkeys_c164,EMonkeys_a164];
_array = [];

_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case east: {"civ"}; case independent: {"med"};};
if (eM_paintball) exitWith {};

{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach EMonkeys_licenses;
_packet pushBack _array;

switch (playerSide) do {
	case west: 
	{
		[] call EMonkeys_fnc_saveGear;
		_packet pushBack cop_gear;
	};
	case civilian: 
	{
		[] call EMonkeys_fnc_civFetchGear;
		_packet pushBack civ_gear;
		_packet pushBack eM_is_arrested;
		_packet set[9,(player getVariable "perms")];
	};
	case east: 
	{
		[] call EMonkeys_fnc_civFetchGear;
		_packet pushBack civ_gear;
		_packet pushBack eM_is_arrested;
		_packet set[9,(player getVariable "perms")];
	};
};
_packet set[10,eM_levelsystemarray];
[_packet,"DB_fnc_updateRequest",false,false] call EMonkeys_fnc_mp;