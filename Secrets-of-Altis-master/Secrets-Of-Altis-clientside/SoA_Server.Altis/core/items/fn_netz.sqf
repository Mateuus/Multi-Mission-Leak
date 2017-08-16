/*
    File: fn_netz.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_netz"];
_netz = "CamoNet_INDP_big_F" createVehicle [0,0,0];
_netz attachTo[player,[0,5.5,0.2]];
_netz setDir 90;
_netz setVariable["item","netzDeployed",true];

life_action_netzDeploy = player addAction["Tarnnetz installieren",{if(!isNull life_netz) then {detach life_netz; life_netz = ObjNull;}; player removeAction life_action_netzDeploy; life_action_netzDeploy = nil;},"",999,false,false,"",'!isNull life_netz'];
life_netz = _netz;
life_netzaktiv = true;
waitUntil {isNull life_netz};
if(!isNil "life_action_netzDeploy") then {player removeAction life_action_netzDeploy;};
if(isNull _netz) exitWith {life_netz = ObjNull;};
_netz setPos [(getPos _netz select 0),(getPos _netz select 1),0];
_netz allowDamage false;