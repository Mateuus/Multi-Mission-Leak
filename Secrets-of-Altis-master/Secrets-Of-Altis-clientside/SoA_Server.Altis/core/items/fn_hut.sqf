/*
    File: fn_hut.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_hut"];
_hut = "RoadCone_L_F" createVehicle [0,0,0];
_hut attachTo[player,[0,5.5,0.2]];
_hut setDir 90;
_hut setVariable["item","hutDeployed",true];

life_action_hutDeploy = player addAction["Pylon aufstellen",{if(!isNull life_hut) then {detach life_hut; life_hut = ObjNull;}; player removeAction life_action_hutDeploy; life_action_hutDeploy = nil;},"",999,false,false,"",'!isNull life_hut'];
life_hut = _hut;
waitUntil {isNull life_hut};
if(!isNil "life_action_hutDeploy") then {player removeAction life_action_hutDeploy;};
if(isNull _hut) exitWith {life_hut = ObjNull;};
_hut setPos [(getPos _hut select 0),(getPos _hut select 1),0];
_hut allowDamage false;
