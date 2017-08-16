/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Creates a sandbag for police mcu use
*/
private["_position","_sandBag","_pos","_vehicle"];
_pos = (position player);
_spikeStrip = "Land_BagFence_Long_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,2.5,0.5]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","sandDeployed",true];
_vehicle = _this select 0;

DS_action_sandDeploy = player addAction["Place sandbag",{if(!isNull DS_sandbag) then {detach DS_sandbag; DS_sandbag = ObjNull;}; player removeAction DS_action_sandDeploy; DS_action_sandDeploy = nil;},"",999,false,false,"",'!isNull DS_sandbag'];
DS_sandbag = _spikeStrip;
waitUntil {isNull DS_sandbag};
if(!isNil "DS_action_sandDeploy") then {player removeAction DS_action_sandDeploy;};
if(isNull _spikeStrip) exitWith {DS_sandbag = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
if(isOnRoad _spikeStrip) exitwith {hint "You can not place this on a road";deleteVehicle _spikeStrip;};
if(_spikeStrip distance _vehicle > 50) exitwith {hint "You can not place this so far from the truck";deleteVehicle _spikeStrip;};
DS_action_sandPickUp = player addAction["Pick up sandbag",DS_cop_packupSandBag,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Land_BagFence_Long_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];




//CamoNet_OPFOR_open_F