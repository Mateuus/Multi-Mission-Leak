/*
    File: fn_pylone.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_pylone"];
_pylone = "RoadCone_L_F" createVehicle [0,0,0];
_pylone attachTo[player,[0,1.2,0.2]];
_pylone setDir 0;
_pylone setVariable["item","pyloneDeployed",true];

ES_action_pyloneDeploy = player addAction["<t color='#00FF00'>Pylone aufstellen</t>",{if(!isNull ES_pylone) then {detach ES_pylone; ES_pylone = ObjNull;}; player removeAction ES_action_pyloneDeploy; ES_action_pyloneDeploy = nil;},"",999,false,false,"",'!isNull ES_pylone'];
ES_pylone = _pylone;
waitUntil {isNull ES_pylone};
if(!isNil "ES_action_pyloneDeploy") then {player removeAction ES_action_pyloneDeploy;};
if(isNull _pylone) exitWith {ES_pylone = ObjNull;};
_pylone setPos [(getPos _pylone select 0),(getPos _pylone select 1),0];
_pylone allowDamage false;