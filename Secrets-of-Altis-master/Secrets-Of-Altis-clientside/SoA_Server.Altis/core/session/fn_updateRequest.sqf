/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_player","_packet","_arraylicense","_arrayquest","_arrayerfolg","_flag","_all_houses"];
_player = player;
_packet = [getPlayerUID _player,(profileName),playerSide,life_beatgeld,life_beatbankgeld,life_exp,life_serverpoints,life_guthaben];
_arraylicense = [];
_arrayquest = [];
_arrayerfolg = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_arraylicense pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _arraylicense;

[] call life_fnc_saveGear;
_packet pushBack life_gear;
_packet pushBack alive _player;

{
	_arrayerfolg pushBack [_x,(missionNamespace getVariable _x)];
} foreach life_erfolge;
_packet pushBack _arrayerfolg;

switch (playerSide) do {
	case civilian: {_packet pushBack life_is_arrested};
	case west: {_packet pushBack life_activity};
	case independent: {_packet pushBack life_activity};
};

if!(isNil "timecollected") then {
	_timeplayed = timecollected + round((diag_tickTime - timestarted) / 60);
	_packet pushBack _timeplayed;
};

if(isNull _player OR isnil "_player") exitWith {};

_packet remoteExec ["DB_fnc_updateRequest",2];