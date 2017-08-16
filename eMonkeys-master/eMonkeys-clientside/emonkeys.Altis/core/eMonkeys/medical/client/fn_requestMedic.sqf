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
	[[player,profileName],"EMonkeys_fnc_medicRequest",independent,FALSE] call EMonkeys_fnc_mp;
	jhmedsys_maxTime = jhmedsys_maxTime + 180;
	player setVariable ["medRequested",true, true];

[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;

};
} else{

((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
};


