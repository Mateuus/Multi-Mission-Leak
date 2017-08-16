

private ["_lvl","_display","_lb_gespeicherte_skripts","_sel","_code"];

disableSerialization;

_lvl = (call LHM_adminlevel);
if (_lvl < 3) exitWith {hint "Das kannst du noch nicht, Ätschie Bätsch :D ";};
if(isnull (findDisplay 9858)) exitWith {};

_display = findDisplay 9858;

_lb_gespeicherte_skripts = _display displayCtrl 1503;

_sel = lbCurSel _lb_gespeicherte_skripts;

_code = profileNamespace getvariable[format["Saved_skripts_%1",_sel],["",{}]];

[] spawn (_code select 1);

