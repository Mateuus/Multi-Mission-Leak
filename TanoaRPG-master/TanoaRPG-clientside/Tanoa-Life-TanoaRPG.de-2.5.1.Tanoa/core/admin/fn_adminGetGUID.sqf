#include <macro.h>
/*
	File: fn_adminGetID.sqf
	Author: CooliMC "Marc"
	
	Description:
	Get the GUID
	YOU ARE NOT ALLOWED TO STEEL IT !!!!
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
((findDisplay 2900) displayCtrl 2903) ctrlSetText "Querying player......";

life_searchGUIDs = "";
life_waitforGUIDs = true;
[player, 1, getPlayerUID _unit] remoteExec ["TEX_FNC_AdminBan", 2];
[] spawn 
{
	waitUntil {!life_waitforGUIDs};
	_data = (life_searchGUIDs select 0);
	((findDisplay 2900) displayCtrl 2903) ctrlSetStructuredText parseText format["NAME: %1<br/>PID: %2<br/>GUID: %3", (_data select 0), (_data select 1), (_data select 2)];
};

[player, _unit, 3, "[ADMIN-Menu]", "Hat PlayerId und GUID abgefragt"] remoteExec ["TEX_FNC_LOGIT", 2];