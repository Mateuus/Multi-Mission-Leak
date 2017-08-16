#include "..\script_macros.hpp"
/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];
_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","spikeDeployed",true];

ES_action_spikeStripDeploy = player addAction[localize "STR_ISTR_Spike_Place",{if(!isNull ES_spikestrip) then {detach ES_spikeStrip; ES_spikeStrip = ObjNull;}; player removeAction ES_action_spikeStripDeploy; ES_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull ES_spikestrip'];
ES_spikestrip = _spikeStrip;
waitUntil {isNull ES_spikeStrip};

if(!isNil "ES_action_spikeStripDeploy") then {player removeAction ES_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {ES_spikestrip = ObjNull;};

_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;

ES_action_spikeStripPickup = player addAction[localize "STR_ISTR_Spike_Pack",ES_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
[_spikeStrip] remoteExec ["ES_fnc_spikeStrip",2]; //Send it to the server for monitoring.