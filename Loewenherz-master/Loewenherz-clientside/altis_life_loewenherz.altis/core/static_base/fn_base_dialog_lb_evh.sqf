





private ["_display","_lb","_camera","_strText_Programm","_str_text_Info","_map","_gang_header","_uhr","_conf","_sel","_val","_ret"];

disableSerialization;




_display = findDisplay 2578;

_lb = _display displayCtrl 1500;
_camera = _display displayCtrl 1200;
_strText_Programm = _display displayCtrl 1100;
_str_text_Info = _display displayCtrl 1101;
_map = _display displayCtrl 1002;
_lb = _display displayCtrl 1500;

_gang_header =  _display displayCtrl 1005;
_uhr = _display displayCtrl 1006;

_conf = [nil,true] call lhm_fnc_base_conf;


_sel = lbCurSel _lb;

if(_sel == -1) exitWith {};

_val = _lb lbValue _sel;


_ret = [_val,false] call lhm_fnc_base_conf;

if(_ret select 1) exitWith {hint "Das kann man nicht ausführen!"};


(_ret select 3) spawn (_ret select 2);


