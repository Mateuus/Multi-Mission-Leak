



private ["_display","_lb_skripts","_EDIT","_tempArray","_sel","_var","_foreachindex","_foreachIndex","_lb_gespeicherte_skripts"];
disableSerialization;


if((call lhm_adminlevel) isEqualTo 0) exitWith {hint "Kein Admin!";};
if((call lhm_adminlevel) < 3) exitWith {hint "Falsches AdminLVL!";};
if(isnull (findDisplay 8574)) exitWith {};


_display = findDisplay 8574;
_lb_skripts = _display displayCtrl 1500;
_EDIT = _display displayCtrl 1400;
_tempArray = [];
_sel = lbCurSel _lb_skripts;
if(_sel == -1) exitWith {};




profileNamespace setvariable[format["Saved_skripts_%1",_sel],nil];
lbClear _lb_skripts;

{
	_var = nil;
	_var = profileNamespace getvariable format["Saved_skripts_%1",_foreachindex];
	if(isnil "_var") then {
		_lb_skripts lbadd "Ungenutzt";
		_lb_skripts lbsetvalue[_foreachindex,_foreachIndex];
		_lb_skripts lbSetColor[_foreachindex,[1,0,0,1]];
	} else {
		_lb_skripts lbadd (_var select 0);
		_lb_skripts lbsetvalue[_foreachindex,_foreachIndex];
		_lb_skripts lbSetColor[_foreachindex,[0.004,0.875,0.004,1]];
	};


} foreach [1,2,3,4,5,6,7,8,9,10];


waitUntil {isnull (findDisplay 8574)};
_display = findDisplay 9858;

_lb_gespeicherte_skripts = _display displayCtrl 1503;
_tempArray = [];

lbClear _lb_gespeicherte_skripts;
{
	_var = nil;
	_var = profileNamespace getvariable format["Saved_skripts_%1",_foreachindex];
	if(isnil "_var") then {
		_lb_gespeicherte_skripts lbadd "Ungenutzt";
		_lb_gespeicherte_skripts lbsetvalue[_foreachindex,_foreachIndex];
		_lb_gespeicherte_skripts lbSetColor[_foreachindex,[1,0,0,1]];
	} else {
		_lb_gespeicherte_skripts lbadd (_var select 0);
		_lb_gespeicherte_skripts lbsetvalue[_foreachindex,_foreachIndex];
		_lb_gespeicherte_skripts lbSetColor[_foreachindex,[0.004,0.875,0.004,1]];
	};


} foreach [1,2,3,4,5,6,7,8,9,10];