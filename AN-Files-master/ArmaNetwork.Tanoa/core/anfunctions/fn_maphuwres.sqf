#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through life_fnc_MP
*/
private _mode = param [0,0,[0]];
private _packet = [steamid,str(playerSide),nil,_mode];

switch _mode do 
{
	case 0: {
		_packet set [2,CASH];
	};

	case 1: {
		_packet set [2,BANK];
	};

	case 2:
	{

		private _array = [];
		if !((count AN_Licenses) isEqualTo 0) then 
		{
			{
				private _number = [_x,false] call life_fnc_licenseConvert;
				_array pushBack _number;
			} forEach AN_Licenses;
		}; 
		_packet set [2,_array];
	};

	case 3: {
		life_gear = [] call life_fnc_hewudefr;
		_packet set [2,life_gear];
	};

	case 4: {
		//Not yet implemented
	};

	case 6: {
		_packet set [2,CASH];
		_packet set [4,BANK];
	};

	case 8: {
		_packet set [2,life_newPlayer];
	};

	case 9: 
	{
		private _array = [];
		if !((count AN_Skills) isEqualTo 0) then 
		{
			{
				private _number = [_x,false] call life_fnc_skillsConvert;
				_array pushBack _number;
			} forEach AN_Skills;
		}; 
		_packet set [2,_array];
		_packet set [4,SKILLPOINT];
	};
	case 10: {
		_packet set [2,LEVEL];
		_packet set [4,EXP];
		_packet set [5,SKILLPOINT];
	};

	case 11: {
		_packet set [2,life_arrested_time];
	};
	case 12: {
		_packet set [2,life_arrested_time];
		_packet set [4,life_arrested_reason];
	};
};
_packet remoteExecCall ["DB_fnc_updatePartial",2];
