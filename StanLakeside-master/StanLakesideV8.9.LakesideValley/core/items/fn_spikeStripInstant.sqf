/*
	File: fn_spikeStrip.sqf
	
	
	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];
_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","spikeDeployed",true];

life_spikestrip = _spikeStrip;

_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;
life_action_spikeStripPickup = player addAction[localize "STR_ISTR_Spike_Pack",life_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
[_spikeStrip] remoteExec ["TON_fnc_spikeStrip",(call life_fnc_HCC)]; 

_spikeStrip setDir 180;

life_action_spikeStripDeploy = nil;
detach life_spikeStrip;
life_spikeStrip = ObjNull;








