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

life_spikestrip = _spikeStrip;
waitUntil {isNull life_spikeStrip};

if(isNull _spikeStrip) exitWith {life_spikestrip = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;
_spikeStrip addEventHandler["GetOut", {_this call life_fnc_vehicleExit;}];
_spikeStrip setVariable ["owner", player, true];
[[_spikeStrip],"ASY_fnc_spikeStrip",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.
[_spikeStrip,"ASY_fnc_setIdleTime",false,false] spawn life_fnc_MP;

//[[64, player, format["Deployed a spike strip!"]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;