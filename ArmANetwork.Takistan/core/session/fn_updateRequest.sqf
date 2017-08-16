#include <macro.h>

/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag","_arraySkill"];
_packet = [getPlayerUID player,(profileName),playerSide,CASH,BANK];
_array = [];
_arraySkill = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

{
	_varName = LICENSE_VARNAME(configName _x,_flag);
	_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
		_packet pushBack LEVEL;
		_packet pushBack EXP;
		{
			_varName = SKILL_VARNAME(configName _x,_flag);
			_arraySkill pushBack [_varName,SKILL_VALUE(configName _x,_flag)];
		} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Skills"));

		_packet pushBack _arraySkill;
		_packet pushBack SKILLPOINT;
	};
};

packet = _packet;

_packet remoteExecCall ["DB_fnc_updateRequest",2];
