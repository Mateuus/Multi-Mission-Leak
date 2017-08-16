#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_adminCompensate.sqf
	Author: ColinM9991
	
	Description:
	Figure it out.
*/
private["_value","_action","_player","_type","_comp","_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(DS_adminlevel < 2) exitWith {closeDialog 0};
_value = ctrltext 2462;
_value = parseNumber _value;
if((getPlayerUID player) in DS_adminlist1)then
	{
	_player = (name player);
	_uid = getPlayerUID player;
	_type = "Comp";
	if(_value < 1) exitWith {};
	if(_value > 999999) exitWith {hint "You cant comp this amount"};
	if(!([str(_value)] call DS_fnc_isNumber)) exitWith {hint "invalid input"};
	[[_value],"DS_fnc_compRecieve",_unit,false] spawn BIS_fnc_MP;
	hint format["You have sent $%1 to %2",_value,name _unit];
	closeDialog 0;
	};