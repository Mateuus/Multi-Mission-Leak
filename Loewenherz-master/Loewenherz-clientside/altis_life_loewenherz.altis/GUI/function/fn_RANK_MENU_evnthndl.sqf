

private ["_mode","_sel","_arr"];


disableSerialization;
if(isnull(findDisplay 2548)) exitWith {};


_display = findDisplay 2548;
_time = _display displayCtrl 8888;
_lb = _display displayCtrl 1500;
_str_text = _display displayCtrl 1100;

_sel = lbCurSel _lb;


_value = _lb lbValue _sel;


_ret = [1,_value] call lhm_fnc_RANK_MENU_config;

_str_text ctrlSetStructuredText parsetext format["<img image='%2' size='5'></img> <br/>%1", (_ret select 0),(_ret select 1)];
