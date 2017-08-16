#include <macro.h>
/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
private["_medicsOnline"];
_fight = [_this,0,false,[false]] call BIS_fnc_param;
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.
life_corpse setVariable["Requested",true,true];

if(_medicsOnline) then {
	//There is medics let's send them the request.
	[[player,profileName,_fight],"life_fnc_medicRequest",independent,FALSE] call life_fnc_MP;
} else {
	if(EQUAL(LIFE_SETTINGS(getNumber,"revive_cops"),1)) then {
		//No medics were online, send it to the police.
		[[player,profileName,_fight],"life_fnc_copMedicRequest",west,FALSE] call life_fnc_MP;
	};
};

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn
{	
	disableSerialization;
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false; //Request
	((findDisplay 7300) displayCtrl 7307) ctrlEnable false; //RequestFight
	((findDisplay 7300) displayCtrl 7306) ctrlEnable false;	//abort
	((findDisplay 7300) displayCtrl 7302) ctrlEnable false; //respawn
	life_request_cooldown = time + (10*60);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	waitUntil {
		_Timer ctrlSetText format["Auf den Notarzt warten: %1",[(life_request_cooldown - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		round life_request_cooldown <= time OR (isNull (findDisplay 7300))
	};
	
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
	((findDisplay 7300) displayCtrl 7307) ctrlEnable true;
	((findDisplay 7300) displayCtrl 7306) ctrlEnable true;
	((findDisplay 7300) displayCtrl 7302) ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};