#include <macro.h>
/*
	
	
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through BIS_fnc_MP
*/

if( player distance (getMarkerPos "respawn_civilian") < 33 || player distance (getMarkerPos "respawn_west") < 33 || player distance (getMarkerPos "respawn_west_1") < 33 ) exitwith {};

params [["_mode", 0, [0]], "_packet", "_array", "_flag"];
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case east:{"civ"}; case civilian: {"civ"}; case independent: {"med"};};

switch(_mode) do {
	case 0: {
		_packet set[2,cash_in_hand];
	};
	
	case 1: {
		_packet set[2,cash_in_bank];
	};
	
	case 2: {
		{
			if(_x select 1 isEqualTo _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} foreach life_licenses;
		
		_packet set[2,_array];
	};
	
	case 3: {
		call life_fnc_saveGear;
		_packet set[2,life_gear];
	};
	
	case 5: {
		_packet set[2,life_is_arrested];
	};
	
	case 6: {
		_packet set[2,cash_in_hand];
		_packet set[4,cash_in_bank];
	};

	case 7: {
		_packet set[2,life_karma];
	};
	
	case 8: {
		_packet set[2,cash_in_hand];
		_packet set[4,cash_in_bank];
		_packet set[5,life_karma];
		call life_fnc_saveGear;
		_packet set[6,life_gear];		
	};
};

_packet remoteExecCall ["DB_fnc_updatePartial",(call life_fnc_HCC)];