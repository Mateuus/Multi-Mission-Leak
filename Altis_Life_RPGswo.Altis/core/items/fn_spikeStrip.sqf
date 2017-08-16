/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];
closeDialog 0;
_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","spikeDeployed",true];

DWEV_action_spikeStripDeploy = player addAction["Nagelbänder auslegen",{if(!isNull DWEV_spikestrip) then {detach DWEV_spikeStrip; DWEV_spikeStrip = ObjNull;}; player removeAction DWEV_action_spikeStripDeploy; DWEV_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull DWEV_spikestrip'];
DWEV_spikestrip = _spikeStrip;
waitUntil {isNull DWEV_spikeStrip};
if(!isNil "DWEV_action_spikeStripDeploy") then {player removeAction DWEV_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {DWEV_spikestrip = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;
DWEV_action_spikeStripPickup = player addAction["Nagelbänder zusammenpacken",DWEV_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
[_spikeStrip] remoteExec ["DWF_fnc_spikeStrip",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Kein remoteExec