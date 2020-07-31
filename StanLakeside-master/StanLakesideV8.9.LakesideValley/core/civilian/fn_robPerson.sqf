/*
	File: fn_robPerson.sqf
	
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = param [0,ObjNull,[ObjNull]];
if(isNull _robber) exitWith {}; //No one to return it to?

if(cash_in_hand > 0) then
{
	[cash_in_hand] remoteExecCall ["life_fnc_robReceive",_robber];
	["cash","set",0] call life_fnc_handleCash; 	
}
	else
{
	[2,format[localize "STR_NOTF_RobFail",profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};
[] spawn fnc_searched;