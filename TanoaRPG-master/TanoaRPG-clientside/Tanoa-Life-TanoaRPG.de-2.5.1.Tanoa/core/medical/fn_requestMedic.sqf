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
	[life_corpse,profileName] remoteExec ["tanoarpg_fnc_medicRequest", independent, FALSE];
	
	if(!life_requestedMedicFoundsPayed) then
	{
		if(life_atmcash >= 70000) then {
			life_atmcash = life_atmcash - 70000;
			life_corpse setVariable["CalledMedic",70000,true];
		} else {
			life_corpse setVariable["CalledMedic",life_atmcash,true];
			life_atmcash = 0;
		};
		life_requestedMedicFoundsPayed = true;
	};
} else {
	//No medics were online, send it to the police.
	[life_corpse,profileName] remoteExec ["tanoarpg_fnc_copMedicRequest", west, FALSE];
};

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep 180;
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};

//Neuer Respawn Timer
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
};

Life_request_timer = true;
[6] call XAS_fnc_updatePartial;