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

EMonkeys_action_spikeStripDeploy = player addAction["Nagelband auslegen",{if(!isNull eM_spikestrip) then {detach eM_spikeStrip; eM_spikeStrip = ObjNull;}; player removeAction EMonkeys_action_spikeStripDeploy; EMonkeys_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull eM_spikestrip'];
eM_spikestrip = _spikeStrip;
waitUntil {isNull eM_spikeStrip};
if(!isNil "EMonkeys_action_spikeStripDeploy") then {player removeAction EMonkeys_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {eM_spikestrip = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;
EMonkeys_action_spikeStripPickup = player addAction["Nagelband einpacken",EMonkeys_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],2] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
[[_spikeStrip],"TON_fnc_spikeStrip",false,false] call EMonkeys_fnc_mp; //Send it to the server for monitoring.