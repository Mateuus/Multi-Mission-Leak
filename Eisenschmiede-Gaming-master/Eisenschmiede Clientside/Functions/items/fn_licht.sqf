/*
    File: fn_licht.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_licht"];
_licht = "Land_PortableLight_double_F" createVehicle [0,0,0];
_licht attachTo[player,[0,2,1.1]]; 
_licht setDir 180;
_licht setVariable["item","lichtDeployed",true];

ES_action_lichtDeploy = player addAction["<t color='#00FF00'>Beleuchtung aufstellen</t>",{if(!isNull ES_licht) then {detach ES_licht; ES_licht = ObjNull;}; player removeAction ES_action_lichtDeploy; ES_action_lichtDeploy = nil;},"",999,false,false,"",'!isNull ES_licht'];
ES_licht = _licht;
waitUntil {isNull ES_licht};
if(!isNil "ES_action_lichtDeploy") then {player removeAction ES_action_lichtDeploy;};
if(isNull _licht) exitWith {ES_licht = ObjNull;};
_licht setPos [(getPos _licht select 0),(getPos _licht select 1),0];
_licht allowDamage false;