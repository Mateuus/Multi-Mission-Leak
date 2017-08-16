#include "..\..\script_macros.hpp"
/*
    File: fn_updateRequest.sqf
    Author: Tonic

    Description:
    Passes ALL player information to the server to save player data to the database.
*/
private ["_packet","_array","_flag","_alive","_position"];
_packet = [getPlayerUID player,(profileName),playerSide,CASH,BANK];
_array = [];
_a = [];
_alive = alive player;
_position = getPosATL player;
_flag = switch (playerSide) do {
	case west: {"cop"}; 
	case civilian: {"civ"}; 
	case independent: {"med"}; 
	case east: {"civ"};
};
life_prof =["Oil_Prof","Iron_Prof","Copper_Prof","Heroin_Prof","Canabis_Prof","Cocain_Prof","Salt_Prof","Fruit_Prof","Diamond_Prof","Rock_Prof","Sand_Prof"];

{
    _varName = LICENSE_VARNAME(configName _x,_flag);
    _array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;

_array = [];
_array pushBack life_hunger;
_array pushBack life_thirst;
_array pushBack (damage player);
_packet pushBack _array;

switch (playerSide) do {
    case civilian: {
        _packet pushBack life_is_arrested;
        _packet pushBack _alive;
        _packet pushBack _position;
		{
			_data = player getVariable _x;
			_profLevel = _data select 0;
			_profExp = _data select 1;
			_a pushBack [_x,[_profLevel,_profExp]];
		} foreach life_prof;
		_packet pushBack _a;
    };
	case east: {
        _packet pushBack life_is_arrested;
        _packet pushBack _alive;
        _packet pushBack _position;
		{
			_data = player getVariable _x;
			_profLevel = _data select 0;
			_profExp = _data select 1;
			_a pushBack [_x,[_profLevel,_profExp]];
		} foreach life_prof;
		_packet pushBack _a;
    };
};

if (life_HC_isActive) then {
    _packet remoteExecCall ["HC_fnc_updateRequest",HC_Life];
} else {
    _packet remoteExecCall ["DB_fnc_updateRequest",RSERV];
};
