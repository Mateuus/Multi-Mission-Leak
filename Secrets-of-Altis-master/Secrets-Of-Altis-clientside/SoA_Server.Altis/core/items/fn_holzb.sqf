/*
    File: fn_holzb.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_holzb"];
_holzb = "RoadBarrier_small_F" createVehicle [0,0,0];
_holzb attachTo[player,[0,5.5,0.2]];
_holzb setDir 90;
_holzb setVariable["item","holzbDeployed",true];

life_action_holzbDeploy = player addAction["Holzbarriere aufstellen",{if(!isNull life_holzb) then {detach life_holzb; life_holzb = ObjNull;}; player removeAction life_action_holzbDeploy; life_action_holzbDeploy = nil;},"",999,false,false,"",'!isNull life_holzb'];
life_holzb = _holzb;
waitUntil {isNull life_holzb};
if(!isNil "life_action_holzbDeploy") then {player removeAction life_action_holzbDeploy;};
if(isNull _holzb) exitWith {life_holzb = ObjNull;};
_holzb setPos [(getPos _holzb select 0),(getPos _holzb select 1),0];
_holzb allowDamage false;
