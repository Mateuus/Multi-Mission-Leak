/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];

//--- Check spike strip requirements
if (life_inv_spikeStrip > 0 && {playerSide != west && {!license_civ_advrebel}}) exitWith {hint "Spike strips can only be used by trained professionals"};

//--- Remove spikestrip once used
[false, "spikeStrip", 1] call life_fnc_handleInv;

//--- Spawn anctual spike strip
_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","spikeDeployed",true];

//--- Attach spike strip to hummingbird (allows dropping from vehicle)
if(typeOf vehicle player == "B_Heli_Light_01_F") then
{
	_spikeStrip attachTo[vehicle player,[0,1,-2.5]];
};

life_action_spikeStripDeploy = player addAction[localize "STR_ISTR_Spike_Place",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = ObjNull;}; player removeAction life_action_spikeStripDeploy; life_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull life_spikestrip'];
life_spikestrip = _spikeStrip;
waitUntil {isNull life_spikeStrip};
if(!isNil "life_action_spikeStripDeploy") then {player removeAction life_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {life_spikestrip = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;
life_action_spikeStripPickup = player addAction[localize "STR_ISTR_Spike_Pack",life_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
[[_spikeStrip],"TON_fnc_spikeStrip",false,false] call GTA_fnc_remoteExec; //Send it to the server for monitoring.
