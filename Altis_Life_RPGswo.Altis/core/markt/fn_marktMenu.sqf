#include "..\..\macros.hpp"
/*
	File: fn_marktMenu.sqf
	Author: MarkusSR1984
	
	Description:
	Erstellt eine Liste der legalen und Illegalen Rohstoffe
*/
private["_display","_list"];
disableSerialization;
waitUntil {!isNull (findDisplay 4000)};
_display = findDisplay 4000;
_list = _display displayCtrl 4002;
lbClear _list;

{
	if ((_x select 7) == 2) then // Legale Rohstoffe auflisten
	{
		_name = M_CONFIG(getText,"VirtualItems",(_x select 1),"displayName");
		_icon = M_CONFIG(getText,"VirtualItems",(_x select 1),"icon");
		_list lbAdd format ["%1",_name];
		_list lbSetPicture [(lbSize _list)-1,_icon];
		_list lbSetdata [(lbSize _list)-1,(_x select 1)];
	};
	false;
} count market_array;

//[27,"diamondc",2558,4094,417,5000,0,2,30,"Geschliffener Diamant",-1,100,4]"

{
	if ((_x select 7) == 4) then // Illegale Rohstoffe auflisten
	{
		_name = M_CONFIG(getText,"VirtualItems",(_x select 1),"displayName");
		_icon = M_CONFIG(getText,"VirtualItems",(_x select 1),"icon");
		_list lbAdd format ["%1",_name];
		_list lbSetPicture [(lbSize _list)-1,_icon];
		_list lbSetdata [(lbSize _list)-1,(_x select 1)];
	};
	false;
} count market_array;