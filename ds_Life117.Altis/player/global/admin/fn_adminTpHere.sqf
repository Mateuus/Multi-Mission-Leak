#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(DS_adminlevel < 4) exitWith {closeDialog 0};
if((getPlayerUID player) in DS_adminlist4)then
	{
	private["_unit","_player","_action"];
	_player = (name player);
	private["_target"];
	_target = lbData[2902,lbCurSel (2902)];
	_target = call compile format["%1", _target];
	if(isNil "_target") exitwith {};
	if(isNull _target) exitWith {};
	if(_unit == player) exitWith {};
	_target setPos (getPos player);
	hint format["You have teleported %1 to your location",_target getVariable["name",name _target]];
	[[_player,"Teleport Player"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	};