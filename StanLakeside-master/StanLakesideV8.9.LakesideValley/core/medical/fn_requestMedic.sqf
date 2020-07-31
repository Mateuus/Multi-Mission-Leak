/*
	File: fn_requestMedic.sqf
	
	
	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x isEqualTo independent} && {!(_x getVariable["dead",FALSE])}} count playableUnits > 0;

if(_medicsOnline) then {
	[player,profileName] remoteExecCall ["life_fnc_medicRequest",independent];
};
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	uiSleep (3 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};