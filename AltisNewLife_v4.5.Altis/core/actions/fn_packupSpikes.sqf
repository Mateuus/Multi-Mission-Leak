private["_spikes"];
_spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if(isNil "_spikes") exitWith {};
if(([true,"spikestrip",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_SpikeStrip","PLAIN"];
	player removeAction life_action_spikeStripPickup;
	life_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
};