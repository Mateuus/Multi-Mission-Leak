/*
    File: fn_schranke.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_schranke"];
_schranke = "Land_BarGate_F" createVehicle [0,0,0];
_schranke attachTo[player,[0,2,4.2]]; 
_schranke setDir 0;
_schranke setVariable["item","schrankeDeployed",true];

ES_action_schrankeDeploy = player addAction["<t color='#00FF00'>Schranke aufstellen</t>",{if(!isNull ES_schranke) then {detach ES_schranke; ES_schranke = ObjNull;}; player removeAction ES_action_schrankeDeploy; ES_action_schrankeDeploy = nil;},"",999,false,false,"",'!isNull ES_schranke'];
ES_schranke = _schranke;
waitUntil {isNull ES_schranke};
if(!isNil "ES_action_schrankeDeploy") then {player removeAction ES_action_schrankeDeploy;};
if(isNull _schranke) exitWith {ES_schranke = ObjNull;};
_schranke setPos [(getPos _schranke select 0),(getPos _schranke select 1),0];
_schranke allowDamage false;