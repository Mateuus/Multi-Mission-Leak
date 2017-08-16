/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_spikes"];
_spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if(isNil "_spikes") exitWith {};

if(([true,"spikeStrip",1] call DWEV_fnc_handlelnv)) then
{
	titleText["Du hast die Nagelbänder zusammengepackt.","PLAIN"];
	player removeAction DWEV_action_spikeStripPickup;
	DWEV_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
};