#include "..\..\macros.hpp"
/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
#include "..\..\macros.hpp"
private["_info","_display","_list","_entry","_unit"];
disableSerialization;
_info = param [0,[],[[]]];
_display = findDisplay 2400;
_list = _display displayctrl 2401;
//_unit = [];
{
	
	_unit = _x;
	{

		if ((_x select 1 == _unit getVariable["playerUID",getPlayerUID _unit]) && ((getPlayerUID player != _unit getVariable["playerUID",getPlayerUID _unit]) ||  (__GETC__(DWEV_adminlevel) > 1 ))) then //Ab S 
		{
			_list lbAdd format["%1",getPlayerDName(_unit)];
			_list lbSetData [(lbSize _list)-1,str(_x)];
		};
	
	} foreach _info;	
	
} foreach playableUnits;


ctrlSetText[2404,"Verbindung hergestellt."];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "Keine verbrecher.";
};