#include <macro.h>
/*
 Author: Bryan "Tonic" Boardwine

 Description:
 Sends specific information to the server to update on the player,
 meant to keep the network traffic down with large sums of data flowing
 through life_fnc_MP
*/
private["_mode","_packet","_array","_flag"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_addinfo = _this select 1;
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

switch(_mode) do {
	case 0: {
	_packet set[2,life_beatgeld];
	};

	case 1: {
	_packet set[2,life_beatbankgeld];
	};

	case 2: {
	{
	if(_x select 1 == _flag) then
	{
	_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
	} foreach life_licenses;

	_packet set[2,_array];
	};

	case 3: {
	[] call life_fnc_saveGear;
	_packet set[2,life_gear];
	};

	case 4: {
	_packet set[2,life_ausweisdaten];
	};

	case 5: {
	_packet set[2,life_is_arrested];
	};

	case 6: {
	_packet set[2,life_beatgeld];
	_packet set[4,life_beatbankgeld];
	_packet set[6,life_exp]; 
	};

	case 7: {
	_packet set[2,life_exp];
	};
	case 8:{};  // ist das keymanagement aufm server

	case 9:{	// wenn man gestorben ist oder revived wird ist das hier das was ausgeführt.
		_packet set[2,life_beatgeld];
		_packet set[4,life_gear];
		_packet set[6,alive player]; 
	};
	
	case 10: {
		_packet set[2,life_activity];
	};
	
	case 11: {
		{
			_array pushBack [_x,(missionNamespace getVariable _x)];
		} foreach life_erfolge;

		_packet set[2,_array];
	};
	
	case 12: {
		_packet set[2,life_serverpoints];
	};
	
	case 13: {
		{
			_array pushBack [_x,(missionNamespace getVariable _x)];
		} foreach life_apps;
		
		_packet set[2,_array];
	};
	
	case 14: {
		_packet set[2,_addinfo];
	};
	
	case 15: {
		_packet set[2,life_kontakte];
	};

	case 16: {
		_packet set[2,life_veh_kfz];
	};
};

_packet remoteExecCall ["DB_fnc_updatePartial",2];