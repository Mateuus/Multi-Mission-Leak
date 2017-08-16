/*
	File: fn_medicRespond.sqf
	Author: speed

	Description:
	Tasks the medic to revive the player whose call they accepted
*/

private["_caller"];
_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull life_medic_target) then {
  life_medic_target = _caller;
  life_medic_startpos = getPos player;
  hint format["%1 has been informed that you are en-route.  Make haste!", name life_medic_target];
} else {
  hint format["You are already responding to %1!", name life_medic_target];
};
