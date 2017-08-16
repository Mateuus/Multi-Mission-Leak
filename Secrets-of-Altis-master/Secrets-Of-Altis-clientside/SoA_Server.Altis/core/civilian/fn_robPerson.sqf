/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(life_beatgeld > 0) then
{
	[life_beatgeld] remoteExecCall ["life_fnc_robReceive",_robber];
	[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"] remoteExecCall ["SOA_fnc_wantedAdd",2];
	[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[life_beatgeld] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",0];
	life_beatgeld = 0;
	["1"] call SOCK_fnc_syncData;
}
	else
{
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};