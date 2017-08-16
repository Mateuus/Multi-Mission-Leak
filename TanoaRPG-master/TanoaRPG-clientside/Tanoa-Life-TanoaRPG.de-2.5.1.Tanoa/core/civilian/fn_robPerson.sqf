/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber","_robbedCash"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(life_cash > 0) then
{
	_robbedCash = life_cash;
	life_cash = 0;
	["1"] call XAS_fnc_syncData;
	[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"] remoteExec ["tanoarpg_fnc_wantedAdd", 2, false];
	[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[_robbedCash] call tanoarpg_fnc_numberText]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
	[_robbedCash] remoteExec ["tanoarpg_fnc_robReceive", _robber, false];
	[player, _robber, _robbedCash, "ROBBED", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];
}
	else
{
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExec ["tanoarpg_fnc_broadcast", _robber, false];
};