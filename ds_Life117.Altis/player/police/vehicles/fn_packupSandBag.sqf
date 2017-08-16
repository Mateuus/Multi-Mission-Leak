/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Packs up a deployed sandbag
*/
private["_spikes"];
_spikes = nearestObjects[getPos player,["Land_BagFence_Long_F"],4] select 0;
if(isNil "_spikes") exitWith {};

titleText["Packing Sandbag","PLAIN"];
player removeAction DS_action_sandPickUp;
DS_action_sandPickUp = nil;
deleteVehicle _spikes;
