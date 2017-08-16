/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through EMonkeys_fnc_MP
*/
private["_mode","_packet","_array","_flag"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_packet = [getPlayerUID player,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case east: {"civ"}; case independent: {"med"};};

if (eM_paintball) exitWith {};

switch(_mode) do {
	case 0: {
		_packet set[2,EMonkeys_c164];
	};
	
	case 1: {
		_packet set[2,EMonkeys_a164];
	};
	
	case 2: {
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} foreach EMonkeys_licenses;
		
		_packet set[2,_array];
	};
	
	case 3: {
	

	};
	
	case 4: {
		//Not yet implemented
	};
	
	case 5: {
		_packet set[2,eM_is_arrested];
	};
	
	case 6: {
		_packet set[2,EMonkeys_c164];
		_packet set[4,EMonkeys_a164];
	};
	case 8: {
		_packet set[2,EMonkeys_VIP];
		
	};
};

[_packet,"DB_fnc_updatePartial",false,false] call EMonkeys_fnc_MP;