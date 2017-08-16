/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = param [0,ObjNull,[ObjNull]];
if(isNull _robber) exitWith {};
(finddisplay 49) closedisplay 1;
if(an_cash > 0) then {
	[an_cash,player,_robber] remoteExecCall ["life_fnc_zamavubagu",_robber];
	[1,"STR_NOTF_Robbed",true,[_robber getVariable ["realname",name _robber],profileName,[an_cash] call life_fnc_rupadudejat]] remoteExecCall ["life_fnc_brusathusek",-2];
	[an_cash,0,1] call life_fnc_sewawruk;
} else {
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["life_fnc_brusathusek",_robber];
};
[0] call life_fnc_maphuwres;
