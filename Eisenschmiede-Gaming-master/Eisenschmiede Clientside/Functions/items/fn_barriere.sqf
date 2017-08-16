/*
    File: fn_barriere.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_barriere"];
_barriere = "RoadBarrier_F" createVehicle [0,0,0];
_barriere attachTo[player,[0,1.2,0.6]]; 
_barriere setDir 0;
_barriere setVariable["item","barriereDeployed",true];

ES_action_barriereDeploy = player addAction["<t color='#00FF00'>barriere aufstellen</t>",{if(!isNull ES_barriere) then {detach ES_barriere; ES_barriere = ObjNull;}; player removeAction ES_action_barriereDeploy; ES_action_barriereDeploy = nil;},"",999,false,false,"",'!isNull ES_barriere'];
ES_barriere = _barriere;
waitUntil {isNull ES_barriere};
if(!isNil "ES_action_barriereDeploy") then {player removeAction ES_action_barriereDeploy;};
if(isNull _barriere) exitWith {ES_barriere = ObjNull;};
_barriere setPos [(getPos _barriere select 0),(getPos _barriere select 1),0];
_barriere allowDamage false;