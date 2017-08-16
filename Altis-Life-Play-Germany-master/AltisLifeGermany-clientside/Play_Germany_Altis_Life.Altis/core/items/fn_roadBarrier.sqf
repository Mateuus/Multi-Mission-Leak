/*
    File: fn_trafficCone.sqf
    Author: Felix Czylwik
    
    Description:
    Place the traffic cone.
*/
private["_position","_cone"];
if ("RoadBarrier_small_F" in (attachedObjects player)) exitWith {};
_cone = "RoadBarrier_small_F" createVehicle [0,0,0];
_cone attachTo[player,[0,4.5,0.2]];
_cone setDir 90;
_cone setVariable["item","coneDeployed",true];

life_action_barrierDeploy = player addAction["<t color='#00FF00'>Barriere aufstellen</t>",{if(!isNull life_barrier) then {detach life_barrier; life_barrier = ObjNull;}; player removeAction life_action_barrierDeploy; life_action_barrierDeploy = nil;},"",999,false,false,"",'!isNull life_barrier'];
life_barrier = _cone;
waitUntil {isNull life_barrier};
if(!isNil "life_action_barrierDeploy") then {player removeAction life_action_barrierDeploy;};
if(isNull _cone) exitWith {life_barrier = ObjNull;};
_cone setPos [(getPos _cone select 0),(getPos _cone select 1),0];
//_cone allowDamage false;

life_action_trafficConePickup = player addAction["<t color='#FF0000'>Barriere aufheben</t>",life_fnc_packupBarrier,"",0,false,false,"",
' _cones = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_cones" && !isNil {(_cones getVariable "item")}'];
[[_cone],"TON_fnc_spikeStrip",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.