/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
private["_medicsOnline","_doRequest"];


_doRequest = [_this,0,false,[false]] call BIS_fnc_param;

if(time - (player getVariable ["last_revived",-1000]) < 300) then { titleText[format["You were recently revived and cannot be revived again for %1 seconds.",ceil (300 - (time - (player getVariable ["last_revived",-1000])))],"PLAIN"]; };

_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count allPlayers > 0;

life_corpse setVariable["Revive",false,true];
life_corpse setVariable["Reviving",nil,true];
life_corpse setVariable["name",name player, true];

if(_doRequest) then{
	[[player, life_corpse],"life_fnc_medicRequest",true,FALSE] spawn life_fnc_MP;
};

//Create a thread to monitor duration since last request (prevent spammage).
life_allowMedic = nil;
[_doRequest] spawn
{
	if (_this select 0) then {player setVariable["requesting_medic",true, true]; ((findDisplay 7300) displayCtrl 7303) ctrlEnable false;};
	((findDisplay 7300) displayCtrl 7306) ctrlEnable false;
	life_allowMedic = false;
	sleep (2 * 60);
	life_allowMedic = nil;
	player setVariable["requesting_medic",false, true];
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
	((findDisplay 7300) displayCtrl 7306) ctrlEnable true;
};
