/*
	File: fn_spikeStrip.sqf
	
	
	Description:
	Creates a spike strip and preps it.
*/
private["_nearVehicles","_spikeStrip","_Obj"];

_mydir = (getdir player);
_obj = [player, 3.4, _myDir ] call BIS_fnc_relPos; 	
if(_myDir > 30 && _myDir < 181) then {
	_obj = [player, 4.4, _myDir ] call BIS_fnc_relPos; 
};
if(_myDir > 240 && _myDir < 341) then {
	_obj = [player, 2.2, _myDir ] call BIS_fnc_relPos; 	
};
_spikeStrip = createVehicle ["CG_Spikes_Extended", _obj,[], 0, "CAN_COLLIDE"];
_spot = getPos _spikeStrip;
_spikestrip setdir (_myDir - 180);
_spikeStrip setVectorUp surfaceNormal _spot;

waitUntil { uiSleep 0.05; _nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],7]; ( count _nearVehicles > 0 || isNull _spikeStrip || player distance _spikestrip > 250 || deadPlayer ) };
deletevehicle _spikestrip;
if(count _nearVehicles > 0) then { _vehicle = _nearvehicles select 0; [_vehicle] remoteExecCall ["life_fnc_spikeStripEffect",_vehicle]; };






