#include "..\..\script_macros.hpp"
/*
	File: fn_updatePartial.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through remoteExec
*/
private["_mode","_packet","_array","_flag"];
_mode = _this select 0;
_varName = _this select 1;
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
		} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

		_packet set[2,_array];
	};

	case 3: {
		[] call life_fnc_saveGear;
		_packet set[2,life_gear];
	};

	case 4: {
		_packet set[2,life_is_alive];
		_packet set[4,getPosATL player];
	};

	case 5: {
		_packet set[2,life_is_arrested];
	};

	case 6: {
		_packet set[2,CASH];
		_packet set[4,BANK];
	};

	case 7: {
		// Tonic is using for keychain..?
	};
	
	case 8: {
	SVAR_MNS [LICENSE_VARNAME("reb_sniper1","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_sniper2","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_sniper3","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_wsparcie1","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_wsparcie2","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_wsparcie3","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_szturm1","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_szturm2","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_szturm3","civ"),false];
	
	SVAR_MNS [LICENSE_VARNAME("sniper1","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("sniper2","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("sniper3","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("wsparcie1","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("wsparcie2","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("wsparcie3","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("szturm1","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("szturm2","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("szturm3","cop"),false];
	
	SVAR_MNS [LICENSE_VARNAME("gun","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("sec","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("merc","civ"),false];
	
	SVAR_MNS [_varName,true];

		{
			_varName = LICENSE_VARNAME(configName _x,_flag);
			_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
		} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

		_packet set[2,_array];
	};
	
	case 9: {
	SVAR_MNS [LICENSE_VARNAME("gun","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("sec","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("merc","civ"),false];
	SVAR_MNS [_varName,true];

		{
			_varName = LICENSE_VARNAME(configName _x,_flag);
			_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
		} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

		_packet set[2,_array];
	};
	
	case 10: {
	SVAR_MNS [LICENSE_VARNAME("reb_transport1","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_transport2","civ"),false];
	SVAR_MNS [LICENSE_VARNAME("reb_transport3","civ"),false];
	
	SVAR_MNS [LICENSE_VARNAME("transport1","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("transport2","cop"),false];
	SVAR_MNS [LICENSE_VARNAME("transport3","cop"),false];
	SVAR_MNS [_varName,true];

		{
			_varName = LICENSE_VARNAME(configName _x,_flag);
			_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
		} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

		_packet set[2,_array];
	};
};

if(life_HC_isActive) then {
	_packet remoteExecCall ["HC_fnc_updatePartial",HC_Life];
} else {
	_packet remoteExecCall ["DB_fnc_updatePartial",RSERV];
};