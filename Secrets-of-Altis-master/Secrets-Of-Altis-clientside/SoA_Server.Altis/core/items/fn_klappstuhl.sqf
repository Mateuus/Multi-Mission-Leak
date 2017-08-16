/*
    File: fn_klappstuhl.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_klappstuhl"];
_klappstuhl = "Land_CampingChair_V1_F" createVehicle [0,0,0];
player reveal _klappstuhl;
_klappstuhl attachTo[player,[0,5.5,0.2]];
_klappstuhl setDir 90;
_klappstuhl setVariable["item","klappstuhlDeployed",true];

life_action_klappstuhlDeploy = player addAction["Klappstuhl aufstellen",{if(!isNull life_klappstuhl) then {detach life_klappstuhl; life_klappstuhl = ObjNull;}; player removeAction life_action_klappstuhlDeploy; life_action_klappstuhlDeploy = nil;},"",999,false,false,"",'!isNull life_klappstuhl'];
life_klappstuhl = _klappstuhl;
life_klappstuhlaktiv = true;
waitUntil {isNull life_klappstuhl};
if(!isNil "life_action_klappstuhlDeploy") then {player removeAction life_action_klappstuhlDeploy;};
if(isNull _klappstuhl) exitWith {life_klappstuhl = ObjNull;};
_klappstuhl setPos [(getPos _klappstuhl select 0),(getPos _klappstuhl select 1),0];
_klappstuhl allowDamage false;
