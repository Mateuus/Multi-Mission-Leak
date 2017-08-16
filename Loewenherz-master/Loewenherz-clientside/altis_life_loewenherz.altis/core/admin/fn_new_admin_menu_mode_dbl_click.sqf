




private ["_display","_strText_chosen_mode_header","_lb_Mode","_temp","_sel","_foreachIndex"];


disableSerialization;


if((call lhm_adminlevel) isEqualTo 0) exitWith {hint "Kein Admin!";};
if(isnull (findDisplay 9858)) exitWith {};

_display = findDisplay 9858;
_strText_chosen_mode_header = _display displayCtrl 1101;
_lb_Mode = _display displayCtrl 1502;



_temp = [0,1,2,4];
_sel = lbCurSel _lb_Mode;
if(_sel == -1) exitWith {};
if(LHM_selected select _sel == 1) then {
	LHM_selected set[_sel,0];
} else {
	LHM_selected set[_sel,1];
};

if(_sel in _temp) then {
	_temp = _temp - [_sel];
	{
		LHM_selected set[_x,0];
	} foreach _temp;

};


{

	if((LHM_selected select _foreachIndex) == 1) then {
		_lb_Mode lbSetColor[_foreachIndex,[0,1,0,1]];
	} else {
		_lb_Mode lbSetColor[_foreachIndex,[1,0,0,1]];
	};


} foreach ["Skripts","Items","Vehicles","DEV-MODE","Anti-HACK"];

if((LHM_selected select 3) == 1) then {
	profileNamespace setVariable["DEV_Mode",true];
} else {
	profileNamespace setVariable["DEV_Mode",false];
};




[] call lhm_fnc_new_admin_menu_switch_event;



