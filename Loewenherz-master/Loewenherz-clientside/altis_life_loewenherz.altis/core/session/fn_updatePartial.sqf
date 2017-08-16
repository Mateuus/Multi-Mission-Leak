#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through lhm_fnc_mp
*/
private["_mode","_packet","_array","_flag"];
_mode = param [0,0,[0]];
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"sec"};};

switch(_mode) do {
	case 0: {
		_packet set[2,lhm_cash];
	};

	case 1: {
		_packet set[2,lhm_atmcash];
	};

	case 2: {
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} foreach lhm_licenses;

		_packet set[2,_array];
	};

	case 3: {
		[] call lhm_fnc_saveGear;
		_packet set[2,lhm_gear];
	};

	case 4: {
		//Not yet implemented
	};

	case 5: {
		_packet set[2,lhm_is_arrested];
	};

	case 6: {
		_packet set[2,lhm_cash];
		_packet set[4,lhm_atmcash];
	};

	case 8: {
		// Survival
		_packet set[2,[lhm_hunger,lhm_thirst,lhm_health,LHM_disease]];
	};
};
//diag_log format ["updatePartial: %1",_packet];
[_packet,"DB_fnc_updatePartial",false,false] call lhm_fnc_mp;