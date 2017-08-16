/*
	File: fn_applyCharge.sqf
	Author: John "Paratus" VanderZwet
*/

disableSerialization;
if(lbCurSel 5521 == -1) exitWith {hint "You did not select a charge..."};
if (isNull life_charged || !isPlayer life_charged || !alive life_charged) exitWith {};

_label = lbText[5521,(lbCurSel 5521)];
_charge = lbData[5521,(lbCurSel 5521)];

serv_killed = [life_charged,_charge];
publicVariableServer "serv_killed";

[[1, format["%3 has charged %1 with %2.", name life_charged, _label, name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;