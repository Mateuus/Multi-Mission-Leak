


private["_nearVehicles","_spikeStrip"];
_spikeStrip = param [0,ObjNull,[ObjNull]];
if(isNull _spikeStrip) exitWith {}; 

waitUntil {_nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],5]; count _nearVehicles > 0 OR isNull _spikeStrip};

if(isNull _spikeStrip) exitWith {}; 
_vehicle = _nearVehicles select 0;

if(isNil "_vehicle") exitWith {deleteVehicle _spikeStrip;};
[_vehicle] remoteExecCall ["life_fnc_jeswustavu",_vehicle];
deleteVehicle _spikeStrip;
