/*
    File: fn_band.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_band"];
_band = "TapeSign_F" createVehicle [0,0,0];
_band attachTo[player,[0,5.5,0.2]];
_band setDir 90;
_band setVariable["item","bandDeployed",true];

life_action_bandDeploy = player addAction["Absperrband aufstellen",{if(!isNull life_band) then {detach life_band; life_band = ObjNull;}; player removeAction life_action_bandDeploy; life_action_bandDeploy = nil;},"",999,false,false,"",'!isNull life_band'];
life_band = _band;
waitUntil {isNull life_band};
if(!isNil "life_action_bandDeploy") then {player removeAction life_action_bandDeploy;};
if(isNull _band) exitWith {life_band = ObjNull;};
_band setPos [(getPos _band select 0),(getPos _band select 1),0];
_band allowDamage false;
