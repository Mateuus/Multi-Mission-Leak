/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	N/A
*/
private["_medicsOnline","_doRequest"];

_doRequest = [_this,0,false,[false]] call BIS_fnc_param;

if(time - (player getVariable ["last_revived",-1000]) < 300) exitWith { titleText[format["You were recently revived and cannot be revived again for %1 seconds.",ceil (300 - (time - (player getVariable ["last_revived",-1000])))],"PLAIN"]; };

_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; 

life_corpse setVariable["Revive",false,true];
life_corpse setVariable["name",name player, true];


[[life_corpse,name player],"life_fnc_medicRequest",true,FALSE] spawn BIS_fnc_MP;

//Create a thread to monitor duration since last request (prevent spammage).
life_allowMedic = nil;
[_doRequest] spawn 
{
	if (_this select 0) then { ((findDisplay 7300) displayCtrl 7303) ctrlEnable false; };
	((findDisplay 7300) displayCtrl 7306) ctrlEnable false;
	life_allowMedic = false;
	sleep (2 * 60);
	life_allowMedic = nil;
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
	((findDisplay 7300) displayCtrl 7306) ctrlEnable true;
};