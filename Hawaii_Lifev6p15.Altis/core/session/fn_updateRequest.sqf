#include "..\..\script_macros.hpp"
/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,CASH,BANK];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

{
	_varName = LICENSE_VARNAME(configName _x,_flag);
	_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;

_array = [];
_array pushBack life_hunger;
_array pushBack life_thirst;
_packet pushBack _array;

switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
		_packet pushBack life_is_alive;
		_packet pushBack life_civTime;
		_packet pushBack life_EXPLevel;
		_packet pushBack life_EXPCount;
		_packet pushBack life_EXPKills;
		_packet pushBack life_EXPDeaths;
		_packet pushBack life_EXPZombiekills;
	};
};

_packet remoteExecCall ["DB_fnc_updateRequest",RSERV];
