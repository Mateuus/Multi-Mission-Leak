



private ["_lvl","_display","_time","_lb","_str_text","_icons","_chosen"];



disableSerialization;

_lvl = player getvariable["LHM_DONATORLEVEL",0];

if(_lvl == 0) exitWith {};

closeDialog 0;

waitUntil {!dialog};

createDialog "LHM_Abzeichen";

waitUntil {!isnull(findDisplay 2548)};

_display = findDisplay 2548;
_time = _display displayCtrl 8888;
_lb = _display displayCtrl 1500;
_str_text = _display displayCtrl 1100;
lbClear _lb;
ctrlSetText[8888,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];
_icons = [] call lhm_fnc_RANK_MENU_config;

_chosen = player getvariable["Abzeichen",0];

{
	if(_lvl >= (_x select 2)) then  {
		_id = _lb lbadd format["%1",(_x select 0)];
		_lb lbSetPicture[_id,(_x select 1)];
		_lb lbSetValue[_id,(_foreachindex + 1)];

	};




} foreach _icons;