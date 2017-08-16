/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fires the selected public cop from the police force for the day (until Server Restart)
*/
private["_display","_text","_units","_charge","_chargeStr","_copName"];

_unit = lbData [2902,lbCurSel 2902];
_unit = missionNamespace getVariable _unit;
_copName = (name player);

if((lbCurSel 2902) == -1) exitWith {hint "You haven't selected a cop to fire"};
if(isNil "_unit")exitwith{hint "Error 666: Report to Huntah if you see this error"};
if(isNull _unit) exitWith {hint "Error 667: Report to Huntah if you see this error"};

if((str(_unit) in ["cop_4","cop_1","cop_3","cop_5","cop_6","cop_7"])) then
	{
	[_copName] remoteExec ["DS_cop_fireCopPlayer",_unit];
	}
	else
	{
	hint "You can not fire this person";
	};