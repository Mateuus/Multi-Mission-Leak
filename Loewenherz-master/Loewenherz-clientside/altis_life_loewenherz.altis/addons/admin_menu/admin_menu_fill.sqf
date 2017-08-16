/*private ["_display","_ListboxPlayers","_ListboxSkripts","_execBTN","_fill","_zahl","_result"];
if(!dialog) then {
	createDialog "LHM_Admin_Menu";
};

disableSerialization;

_display = finddisplay 6666;
_ListboxPlayers = _display displayCtrl 1500;
_ListboxSkripts = _display displayCtrl 1501;
_execBTN = _display displayCtrl 2400;

_fill = compile preprocessFileLineNumbers "addons\admin_menu\admin_menu_skripts.sqf";

//_zahl = 0;

//While {true} do {
//	_result = [_zahl] call _fill;
//	if(count(_result) == 0) exitWIth {};
//	_ListboxSkripts lbadd (_result select 0);
//	_ListboxSkripts lbSetValue[_zahl,_zahl];
//
//	_zahl = _zahl + 1;
//
//};



_result = [nil,true] call _fill;

{
	_ListboxSkripts lbadd ((_result select _foreachIndex) select 0);
	_ListboxSkripts lbSetValue[_foreachIndex,_foreachIndex];
} foreach _result;


{
	_ListboxPlayers lbadd (name _x);
	_ListboxPlayers lbsetData [_foreachIndex,(name _x)];

} foreach playableUnits;


_execBTN buttonSetAction "execVM ""addons\admin_menu\exec_btn.sqf""";
*/


[] spawn lhm_fnc_new_admin_menu_build_dialog;