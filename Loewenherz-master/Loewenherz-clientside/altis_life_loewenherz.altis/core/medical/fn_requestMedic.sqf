/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

if(_medicsOnline) then {
	//There is medics let's send them the request.
	[[lhm_corpse,profileName],"lhm_fnc_medicRequest",independent,FALSE] call lhm_fnc_mp;
	lhm_corpse setVariable["lhm_requested",true,true];
} else {
	//No medics were online, send it to the police.
	[[lhm_corpse,profileName],"lhm_fnc_copMedicRequest",west,FALSE] call lhm_fnc_mp;
};

//Create a thread to monitor duration since last request (prevent spammage).
lhm_request_timer = true; // LHM
[] spawn
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (2 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};