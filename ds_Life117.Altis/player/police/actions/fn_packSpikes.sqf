/*
	File: fn_wantedlist
	Author: Shawn "Huntah" Macgillivray
	
	Description:
Packs spike strips
	*/
private["_object"];
_object = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if(isNil "_object") exitWith {};

["spikeStrip",true,1] call DS_fnc_handleInventory;
titleText["SpikeStrip picked up","PLAIN"];
deleteVehicle _object;
DS_spikeStrips = DS_spikeStrips - 1;
publicVariable "DS_spikeStrips";