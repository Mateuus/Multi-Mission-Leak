#include <macro.h>
/*
	File: fn_adminHeal.sqf
	Author: CooliMC "Marc"
	
	Description:
	Heal a player
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

_unit setDamage 0;
[player, _unit, 3, "[ADMIN-Menu]", "Hat geheilt"] remoteExec ["TEX_FNC_LOGIT", 2];
hint format["Du hast %1 geheilt",_unit getVariable["realname",name _unit]];	