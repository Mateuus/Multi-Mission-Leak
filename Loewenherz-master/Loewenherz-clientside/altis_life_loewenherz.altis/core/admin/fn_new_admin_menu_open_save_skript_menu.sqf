



private ["_display","_Code_input","_code","_lb_skripts","_tempArray","_var","_foreachindex","_foreachIndex"];
disableSerialization;


if((call lhm_adminlevel) isEqualTo 0) exitWith {hint "Kein Admin!";};
if((call lhm_adminlevel) < 3) exitWith {hint "Falsches AdminLVL!";};
if(isnull (findDisplay 9858)) exitWith {};

_display = findDisplay 9858;

_Code_input = _display displayCtrl 1401;

Code_temp = ctrltext _Code_input;


createDialog "admin_menu_extended_save_code";

waitUntil {!isnull(findDisplay 8574)};

_display = findDisplay 8574;
_lb_skripts = _display displayCtrl 1500;
_BTN_save = _display displayCtrl 2401;
lbClear _lb_skripts;
_tempArray = [];


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


