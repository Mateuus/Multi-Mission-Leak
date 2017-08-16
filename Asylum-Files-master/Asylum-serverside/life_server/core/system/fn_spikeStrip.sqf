 
 
 
 
 
 
 
 
 
private["_nearVehicles","_spikeStrip","_owner"]; 
_spikeStrip = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if(isNull _spikeStrip) exitWith {};  
 
waitUntil {_nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],5]; count _nearVehicles > 0 OR isNull _spikeStrip}; 
 
if(isNull _spikeStrip) exitWith {};  
_vehicle = _nearVehicles select 0; 
 
if(isNil "_vehicle") exitWith {deleteVehicle _spikeStrip;}; 
[[_vehicle],"life_fnc_spikeStripEffect",_vehicle,false] spawn life_fnc_MP; 
_owner = _spikeStrip getVariable ["owner", objNull]; 
[[200],"life_fnc_addExperience",_owner,false] spawn life_fnc_MP; 
deleteVehicle _spikeStrip;