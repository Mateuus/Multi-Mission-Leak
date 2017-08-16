#include <macro.h>
private["_mode","_packet","_array","_flag","_civPosition"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"adac"};};
switch(_mode) do {
	case 0: {
		_packet set[2,argent_liquide];
	};
	
	case 1: {
		_packet set[2,compte_banque];
	};
	
	case 2: {
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(GVAR_MNS (_x select 0))];
			};
		} foreach life_licenses;
		
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
	};
	
	case 6: {
		_packet set[2,argent_liquide];
		_packet set[4,compte_banque];
	};
	
	case 8: {
		_civPosition = getPos player;
		_packet set[2,_civPosition];
		_packet set[4,life_is_alive];
	};
};
[_packet,"DB_fnc_updatePartial",false,false] call life_fnc_MP;