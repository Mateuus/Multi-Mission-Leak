/*
    File: fn_container.sqf
    Author: demiced
    Change Bloodwyn: Abstand und Höhe aud die Maße von Container angepasst, Textur wird auch beim Aufbauen angezeigt.
    Description:
    Holt den Medic Container aus dem Inventar und setzt ihn auf die Map.
*/
private["_position","_container"];
_container = "Land_Pod_Heli_Transport_04_medevac_F" createVehicle [0,0,0];
_container attachTo[player,[0,3,1.4]];
_container setDir 90;
_container setVariable["item","containerDeployed",true];

_container setObjectTextureGlobal [0,"core\textures\vehicles\Container\med_container_0.jpg"];
_container setObjectTextureGlobal [1,"core\textures\vehicles\Container\med_container_1.jpg"];

lhm_action_containerDeploy = player addAction["<t color='#00FF00'>Container aufstellen</t>",{if(!isNull lhm_container && playerSide == independent) then { detach lhm_container; lhm_container = ObjNull;}; player removeAction lhm_action_containerDeploy; lhm_action_containerDeploy = nil;},"",999,false,false,"",'!isNull lhm_container && (playerSide == independent)'];


player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
lhm_container = _container;
waitUntil {isNull lhm_container};
if(!isNil "lhm_action_containerDeploy") then {player removeAction lhm_action_containerDeploy;};
if(isNull _container) exitWith {lhm_container = ObjNull;};
_container setPos [(getPos _container select 0),(getPos _container select 1),0];
_container allowDamage false;
