/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/lhm/list.txt for servers that are permitted to use this code.
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"

	Description:
	Displays wanted list information sent from the server.
*/
private["_info","_display","_list","_units","_entry"];
disableSerialization;
_info = param [0,[],[[]]];
LHM_LOCAL_WANTED_LIST = _info;
_display = findDisplay 2400;
_list = _display displayctrl 2401;

_units = [];
{
	//if (!((side _x) == west)) then {
	if ((side _x) == civilian) then {
		//_units pushBack (_x getVariable["realname",name _x]);
		_units pushBack (name _x);
	};
} foreach playableUnits;

{
	_entry = _x;
	if((_entry select 0) in _units) then
	{
		_list lbAdd format["%1", _entry select 0];
		_list lbSetData [(lbSize _list)-1,str(_entry)];
	};
} foreach _info;

ctrlSetText[2404,"Connection Established"];
lbSort[_list,"ASC"];
if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "No criminals";
};