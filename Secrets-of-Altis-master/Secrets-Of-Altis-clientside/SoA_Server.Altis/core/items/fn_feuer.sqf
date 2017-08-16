/*
    File: fn_feuer.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_feuer"];
_feuer = "Land_Campfire_F" createVehicle [0,0,0];
_feuer attachTo[player,[0,5.5,0.2]];
_feuer setDir 90;
_feuer setVariable["item","feuerDeployed",true];

life_action_feuerDeploy = player addAction["Lagerfeuer aufstellen",{if(!isNull life_feuer) then {detach life_feuer; life_feuer = ObjNull;}; player removeAction life_action_feuerDeploy; life_action_feuerDeploy = nil;},"",999,false,false,"",'!isNull life_feuer'];
life_feuer = _feuer;
life_feueraktiv = true;
waitUntil {isNull life_feuer};
if(!isNil "life_action_feuerDeploy") then {player removeAction life_action_feuerDeploy;};
if(isNull _feuer) exitWith {life_feuer = ObjNull;};
_feuer setPos [(getPos _feuer select 0),(getPos _feuer select 1),0];
_feuer allowDamage false;
