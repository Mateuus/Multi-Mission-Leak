/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,lhm_cash,lhm_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"sec"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach lhm_licenses;
_packet pushBack _array;

[] call lhm_fnc_saveGear;
_packet pushBack lhm_gear;

// papabears-persistent-proficiency-system //
_profs = [];
{
	if(_x select 1 == _flag) then
	{
		_data = missionNamespace getVariable (_x select 0);
		_profs pushBack [_x select 0,_data select 0,_data select 1];
	};
} foreach lhm_prof;
_packet pushBack _profs;
// papabears-persistent-proficiency-system //

switch (playerSide) do {
	case civilian: {
		_packet pushBack lhm_is_arrested;
	};
	case west: {
		_packet set [count _packet, nil];
	};
	case independent: {
		_packet set [count _packet, nil];
	};
	case east: {
		_packet set [count _packet, nil];
	};
};

// survival
_packet pushBack [lhm_hunger,lhm_thirst,lhm_health,LHM_disease];

saveProfileNamespace;

[_packet,"DB_fnc_updateRequest",false,false] call lhm_fnc_mp;