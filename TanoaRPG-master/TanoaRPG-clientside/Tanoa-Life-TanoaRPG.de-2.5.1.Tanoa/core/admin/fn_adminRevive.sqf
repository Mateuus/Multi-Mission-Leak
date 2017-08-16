#include <macro.h>
/*
	File: fn_adminRevive.sqf
	Author: CooliMC "Marc"
	
	Description:
	Revives a player
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

if(format["%1",(_unit getVariable "Revive")] == "false") then
{
	[format["[ADMIN] %1",player getVariable["realname",name player]]] remoteExec ["tanoarpg_fnc_revived", _unit, FALSE];
	[player, _unit, 3, "[ADMIN-Menu]", "Hat wiederbelebt"] remoteExec ["TEX_FNC_LOGIT", 2];
	hint format["Du hast %1 wiederbelebt",_unit getVariable["realname",name _unit]];
} else {
	[player, _unit, 3, "[ADMIN-Menu]", "Hat versucht wiederzubeleben", "[SPIELER-NOCH-AM-LEBEN-ERROR]"] remoteExec ["TEX_FNC_LOGIT", 2];
	hint format["Du hast versucht %1, der noch am Leben ist, wiederzubeleben",_unit getVariable["realname",name _unit]];
};

