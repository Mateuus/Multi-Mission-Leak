/*
    File: fn_sperre.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_sperre"];
_sperre = "RoadBarrier_F" createVehicle [0,0,0];
_sperre attachTo[player,[0,5.5,0.2]];
_sperre setDir 90;
_sperre setVariable["item","sperreDeployed",true];

life_action_sperreDeploy = player addAction["Straﬂensperre aufstellen",{if(!isNull life_sperre) then {detach life_sperre; life_sperre = ObjNull;}; player removeAction life_action_sperreDeploy; life_action_sperreDeploy = nil;},"",999,false,false,"",'!isNull life_sperre'];
life_sperre = _sperre;
waitUntil {isNull life_sperre};
if(!isNil "life_action_sperreDeploy") then {player removeAction life_action_sperreDeploy;};
if(isNull _sperre) exitWith {life_sperre = ObjNull;};
_sperre setPos [(getPos _sperre select 0),(getPos _sperre select 1),0];
_sperre allowDamage false;
