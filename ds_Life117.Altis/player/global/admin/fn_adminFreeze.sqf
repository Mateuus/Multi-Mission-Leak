#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_adminFreeze.sqf
	Author: ColinM9991
 
	Description: Freezes selected player
*/
if(DS_adminlevel < 4) exitWith {closeDialog 0};

private["_unit","_player","_action"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {};
_player = (name player);
if((getPlayerUID player) in DS_adminlist4)then
	{
	if(DS_frozen) then {
		[{disableUserInput false;},"BIS_fnc_Spawn",_unit,false] call BIS_fnc_MP;
		hint format["You have unfrozen %1",_unit getVariable["name",_unit]];
		DS_frozen = false;
		[[_player,"un-Froze a player"],"life_fnc_DarkSide_ShowAll"] spawn BIS_fnc_MP;
	} else {
		[{disableUserInput true;},"BIS_fnc_Spawn",_unit,false] call BIS_fnc_MP;
		hint format["You have frozen %1",_unit getVariable["name",_unit]];
		DS_frozen = true;
		[[_player,"Froze a player"],"life_fnc_DarkSide_ShowAll"] spawn BIS_fnc_MP;
	};
	};