#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_adminFreeze.sqf
	Author: ColinM9991
 
	Description: Freezes selected player
	
	Edited by Huntah to script kill a player
*/
if(DS_adminlevel < 4) exitWith {closeDialog 0};

private["_unit","_player","_action"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
_player = (name player);
if((getPlayerUID player) in DS_adminlist4)then
	{
	[[],"DS_fnc_adminKillPlayer",_unit,false] spawn DS_fnc_MP;
	[[_player,"Script Kill"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	};