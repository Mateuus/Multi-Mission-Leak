/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag","_civPosition"];
_civPosition = getPos player;
diag_log format ["%1",_civPosition];
_packet = [getPlayerUID player,(profileName),playerSide,life_cash,life_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;

_profs = [];
{
	if(_x select 1 == _flag) then
	{
		_data = missionNamespace getVariable (_x select 0);
		_profs pushBack [_x select 0, _data select 0, _data select 1];
	};
} forEach life_prof;
_packet pushBack _profs;

switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
		_packet set[count _packet,_civPosition];
		_packet set[count _packet,life_is_alive];
	};
};

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;