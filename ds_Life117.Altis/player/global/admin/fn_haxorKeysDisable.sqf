#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	Author: Huntah
	
	Description:
	Now releases one from jail.
*/
private["_value","_action","_player","_type","_comp","_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(DS_adminlevel < 2) exitWith {closeDialog 0};
[[_unit,true],"DS_civ_releaseme",_unit,false] spawn BIS_fnc_MP;