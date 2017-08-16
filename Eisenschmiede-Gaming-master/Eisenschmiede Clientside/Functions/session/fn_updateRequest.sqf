#include "..\script_macros.hpp"
/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
if(BinImPaintball) exitWith {};
if(BinImShop) exitWith {};
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,ES_cash,ES_atmbank];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

{
	_varName = LICENSE_VARNAME(configName _x,_flag);
	_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;

[] call ES_fnc_saveGear;
_packet pushBack ES_gear;

switch (playerSide) do {

	case west: {
		_packet pushBack ES_xp_cop;
	};

	case independent: {
		_packet pushBack ES_xp_med;
	};

	case civilian: {
		_packet pushBack ES_is_arrested;
		_packet pushBack ES_xp_civ;
		_array = [];
		_array pushBack ES_hunger;
		_array pushBack ES_thirst;
		_array pushBack (damage player);
		_packet pushBack _array;
	};
};

_packet remoteExec ["ES_fnc_updateRequest",2];