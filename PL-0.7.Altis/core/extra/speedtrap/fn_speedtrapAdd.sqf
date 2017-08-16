
if(isNil "life_speedtrap") then {life_speedtrap = ObjNull;};

private["_speedtrap","_var_speedtrap","_value_speedtrap"];

if(playerSide != west) exitWith {hint "Vous n'êtes pas habilité à utiliser cet objet.";};
if(vehicle player != player) exitWith {hint "Vous ne pouvez pas utliser cet objet dans un véhicule!";};
if(!isNull life_speedtrap) exitWith {hint "Vous avez déjà posé un radar ailleur.";};

_var_speedtrap = ["radarfalle",0] call life_fnc_varHandle;
_value_speedtrap = missionNamespace getVariable _var_speedtrap;
if(_value_speedtrap <= 0) exitWith {};

_speedtrap = "Land_Runway_PAPI_4" createVehicle (getPosWorld player);
_speedtrap setpos  (player modelToWorld [0,1,0]);
_speedtrap setDir ([_speedtrap, player] call BIS_fnc_dirTo);
_speedtrap allowdamage false;
_speedtrap attachTo[player,[0,1.5,0.5]];
_speedtrap setDir 180;

life_action_speedtrapDeploy = player addAction["Poser Radar",{if(!isNull life_speedtrap) then {detach life_speedtrap; life_speedtrap = ObjNull;}; player removeAction life_action_speedtrapDeploy; life_action_speedtrapDeploy = nil;},"",999,false,false,"",'!isNull life_speedtrap'];
life_speedtrap = _speedtrap;
waitUntil {isNull life_speedtrap};
if(!isNil "life_action_speedtrapDeploy") then {player removeAction life_action_speedtrapDeploy;};
if(isNull _speedtrap) exitWith {};
_speedtrap setPos [(getPos _speedtrap select 0),(getPos _speedtrap select 1),0];

_speedtrap setVariable ["speedtrap_registered", true, true];
_speedtrap setVariable ["speedtrap_active", true, true];
_speedtrap setVariable ["speedtrap_speedlimit", 50, true];
_speedtrap setVariable ["speedtrap_photos", [], true];
_speedtrap setVariable ["speedtrap_name",name player, true];

if(!([false,"radarfalle",1] call life_fnc_handleInv)) exitWith
{
    deleteVehicle _speedtrap;
};
