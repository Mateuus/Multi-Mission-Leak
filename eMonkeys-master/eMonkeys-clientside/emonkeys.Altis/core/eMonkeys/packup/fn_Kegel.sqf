/*
    File: fn_mauer.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_mauer"];
_mauer = "RoadCone_L_F" createVehicle [0,0,0];
_mauer attachTo[player,[0,5.5,0.2]];
_mauer setDir 90;
_mauer setVariable["itemkegel","kegelDeployed",true];

EMonkeys_action_kegelDeploy = player addAction["<t color='#00FF00'>Kegel aufstellen</t>",{if(!isNull EMonkeys_kegel) then {detach EMonkeys_kegel; EMonkeys_kegel = ObjNull;}; player removeAction EMonkeys_action_kegelDeploy; EMonkeys_action_kegelDeploy = nil;},"",999,false,false,"",'!isNull EMonkeys_kegel'];
EMonkeys_kegel = _mauer;
waitUntil {isNull EMonkeys_kegel};
if(!isNil "EMonkeys_action_kegelDeploy") then {player removeAction EMonkeys_action_kegelDeploy;};
if(isNull _mauer) exitWith {EMonkeys_kegel = ObjNull;};
_mauer setPos [(getPos _mauer select 0),(getPos _mauer select 1),0];
_mauer allowDamage false;
