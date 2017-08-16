#include "..\script_macros.hpp"
/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	N/A
*/

ES_medicRequest = false;
ES_maxTime = ES_maxTime + (10 * 60);

ES_corpse setVariable ["Revivable",true,true];

[ES_corpse,profileName] remoteExec ["ES_fnc_medicRequest",independent];

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn  {
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
};