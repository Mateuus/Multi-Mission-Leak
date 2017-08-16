/*	
File: fn_p_prisionbreak.sqf
	Author: Herman "Mordin" Othelius	
	Based on wantedlist by: Bryan "Tonic" Boardwine"
*/

private["_shop","_display","_list","_array","_units","_Btn1","_unit"];_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;disableSerialization;if(player distance _shop > 2) exitWith {hint format ["You need to stay closer!"];};
createDialog "ES_prision_list";_display = findDisplay 8100;_list = _display displayCtrl 8101;lbClear _list;ctrlSetText[8104,"Hacking system..."];_list = _display displayctrl 8101;_units = [];{	
if(side _x == civilian) then {_units pushBack _x;};} forEach nearestObjects [getMarkerPos "jail_marker",["Man"],15]; // 15 = distance from jail_marker// this adds all the prisioners around the jail_marker within 15 meters{	_temp = format["%1", _x];	if(["civ", _temp, false] call BIS_fnc_inString) then {	_list lbAdd format["%1", (_x getVariable["realname",name _x])];	_list lbSetData [(lbSize _list)-1,str(_x)];	};} forEach _units;ctrlSetText[8104,"Connected to system..."];if(((lbSize _list)-1) == -1) then{	_list lbAdd "No prisoners...";};