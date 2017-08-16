#include "..\..\macros.hpp"
/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

if(_medicsOnline) then
{
	[DWEV_corpse,getMyDName] remoteExec ["DWEV_fnc_medicRequest",independent];
	if (!DWEV_ezrequested) then {
		[ObjNull,"Wiederbelebung Angefordert!",player,9] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		DWEV_ezrequested = true;
	};
};

DWEV_request_timer = true;

[] spawn
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (2 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};
