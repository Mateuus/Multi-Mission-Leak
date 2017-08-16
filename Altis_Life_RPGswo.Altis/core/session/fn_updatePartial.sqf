#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through DWEV_OLD_fnc_MP
*/
private["_mode","_packet","_array","_flag","_Lflag"];
_mode = param [0,0,[0]];
_packet = [steamid,(side player),nil,_mode];
_array = [];
_flag = switch((side player)) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"WSC"};};
_Lflag = switch((side player)) do {case west: {"p"}; case civilian: {"c"}; case independent: {"m"}; case east: {"w"};};


if (((player getVariable["DWEV_paintball_dome",false]) || (player getVariable["DWEV_paintball_arena",false])) && !(_mode == 6) ) exitWith {};


switch(_mode) do 
{
	case 0: 
	{
		_packet set[2,dwf_cash];
	};
	
	case 1: 
	{
		_packet set[2,dwf_atmcash];
	};

	case 2: 
	{
		{
			_var = configName(_x);
			_val = LICENSE_VALUE(_var,_Lflag);
			if (_val) then
			{
				_varName = LICENSE_VARNAME(_var,_Lflag);
				_array pushBack [_varName,_val];				
			};
        } forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));
		
		_packet set[2,_array];
	};
	
	case 3: 
	{
		[] call DWEV_fnc_saveGear;
		_packet set[2,DWEV_gear];
	};
	
	case 4: 
	{
		//Not yet implemented
	};
	
	case 5: 
	{
		_packet set[2,DWEV_is_arrested];
	};
	
	case 6: 
	{
		_packet set[2,dwf_cash];
		_packet set[4,dwf_atmcash];
	};
};


_packet remoteExec ["DB_fnc_updatePartial",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];





