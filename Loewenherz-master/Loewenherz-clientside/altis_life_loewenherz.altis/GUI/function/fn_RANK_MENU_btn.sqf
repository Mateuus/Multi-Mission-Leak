





private ["_display","_time","_lb","_str_text","_sel","_value","_clr"];
disableSerialization;
if(isnull(findDisplay 2548)) exitWith {};


_display = findDisplay 2548;
_time = _display displayCtrl 8888;
_lb = _display displayCtrl 1500;
_str_text = _display displayCtrl 1100;

_sel = lbCurSel _lb;

if(_sel == -1) exitWith {hint "Du musst vorher ein Abzeichen auswählen"};

_value = _lb lbValue _sel;

player setVariable["Abzeichen",_value,true];
LHM_Abzeichen = _value;



