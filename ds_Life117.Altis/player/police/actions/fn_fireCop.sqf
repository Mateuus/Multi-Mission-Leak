/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Fires the selected public cop from the police force for the day (Until Server Restart)
*/
private["_display","_text","_units","_charge","_chargeStr","_copName"];

_unit = lbData [2902,lbCurSel 2902];
_unit = call compile format["%1",_unit];
_copName = (name player);

//systemchat format ["Details, Your name: %1 || Fired Cops unit: %2 || Fired cops name: %3",(name player),(_unit),(name _unit)];
if(isNil {_unit})exitwith{hint "Error 666: Report to Huntah if you see this error"};
if(isNull _unit) exitWith {hint "Error 667: Report to Huntah if you see this error"};
if(isNil "_unit") exitWith {hint "Error 668: Report to Huntah if you see this error"};
if((name _unit) == ("Error: No vehicle")) exitWith {hint "Error 669: Report to Huntah if you see this error"};
if(isNil{name _unit}) exitWith {hint "Error 700: Report to Huntah if you see this error"};

if((str(_unit) in ["cop_1","cop_3","cop_4","cop_5"])) then 
	{
	[[_copName],"DS_cop_fireCopPlayer",_unit,false] spawn BIS_fnc_MP;
	}
	else
	{
	Hint "You can not fire this person";
	};