/*
    File: fn_mauer.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_mauer"];
_mauer = "RoadBarrier_F" createVehicle [0,0,0];
_mauer attachTo[player,[0,5.5,0.2]];
_mauer setDir 90;
_mauer setVariable["item","mauerDeployed",true];

EMonkeys_action_mauerDeploy = player addAction["<t color='#00FF00'>Mauer aufstellen</t>",{if(!isNull EMonkeys_mauer) then {detach EMonkeys_mauer; EMonkeys_mauer = ObjNull;}; player removeAction EMonkeys_action_mauerDeploy; EMonkeys_action_mauerDeploy = nil;},"",999,false,false,"",'!isNull EMonkeys_mauer'];
EMonkeys_mauer = _mauer;
waitUntil {isNull EMonkeys_mauer};
if(!isNil "EMonkeys_action_mauerDeploy") then {player removeAction EMonkeys_action_mauerDeploy;};
if(isNull _mauer) exitWith {EMonkeys_mauer = ObjNull;};
_mauer setPos [(getPos _mauer select 0),(getPos _mauer select 1),0];
_mauer allowDamage false;
