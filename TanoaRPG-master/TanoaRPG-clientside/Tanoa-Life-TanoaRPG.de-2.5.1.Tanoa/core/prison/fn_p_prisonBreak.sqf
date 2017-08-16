/*	
	File: fn_p_prisionbreak.sqf
	Author: Herman "Mordin" Othelius
	Modified by: CooliMC
	
	Description: Better Prison Break start Scrip
*/

private["_laptop","_display","_list","_array","_units"];
_laptop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

disableSerialization;
if(player distance _laptop > 2) exitWith {hint format ["Ohne Haende am Laptop wird das nix mit dem Hacken!"];};

createDialog "life_prison_List";
_display = findDisplay 8100;
_list = _display displayCtrl 8101;

lbClear _list;
ctrlSetText[8104,"Du hackst dich in das System..."];
_list = _display displayctrl 8101;

_units = [];

{
	if(side _x == civilian) then 
	{
		_units pushBack _x;
	};
} forEach nearestObjects [getMarkerPos "jail_marker",["Man"],15];

{
	_temp = format["%1", _x];
	if(["civ", _temp, false] call BIS_fnc_inString) then 
	{
		_list lbAdd format["%1", (_x getVariable["realname",name _x])];
		_list lbSetData [(lbSize _list)-1,str(_x)];
	};
} forEach _units;

ctrlSetText[8104,"Verbunden..."];
if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "Keine Gefangenen im System...";
};
