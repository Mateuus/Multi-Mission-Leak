#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through remoteExec
*/
private["_mode","_packet","_array","_flag"];
_mode = param [0,0,[0]];
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

switch(_mode) do {
	case 0: {
		_packet set[2,CASH];
	};

	case 1: {
		_packet set[2,BANK];
	};

	case 2: {
		{
			_varName = LICENSE_VARNAME(configName _x,_flag);
			_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
		} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

		_packet set[2,_array];
	};

	case 3: {
		[] call life_fnc_saveGear;
		_packet set[2,life_gear];
	};

	case 4: {
		//Not yet implemented
	};

	case 5: {
		_packet set[2,life_is_arrested];
		_pacekt set[4,life_arrestedTime];
	};

	case 6: {
		_packet set[2,CASH];
		_packet set[4,BANK];
	};

	case 7: {
		// Tonic is using for keychain..?
	};
};

_packet remoteExecCall ["DB_fnc_updatePartial",RSERV];
