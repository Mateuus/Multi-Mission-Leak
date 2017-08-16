/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];
if(side player != west) exitWith {hint "Du hast nicht die nötige Ausbildung, diese Nagelbänder zu benutzen"};
if(vehicle player != player) exitWith {hint "Aha, ein Abuser, dein Name wurde vermerkt....."};
_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","spikeDeployed",true];

lhm_action_spikeStripDeploy = player addAction[localize "STR_ISTR_Spike_Place",{if(!isNull lhm_spikestrip) then {detach lhm_spikeStrip; lhm_spikeStrip = ObjNull;}; player removeAction lhm_action_spikeStripDeploy; lhm_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull lhm_spikestrip'];
lhm_spikestrip = _spikeStrip;
waitUntil {isNull lhm_spikeStrip};
if(!isNil "lhm_action_spikeStripDeploy") then {player removeAction lhm_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {lhm_spikestrip = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;
[[_spikeStrip],"TON_fnc_spikeStrip",false,false] call lhm_fnc_mp; //Send it to the server for monitoring.