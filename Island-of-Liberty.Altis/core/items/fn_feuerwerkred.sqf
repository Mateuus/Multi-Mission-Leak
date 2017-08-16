private["_position","_feuerwerk"];
_feuerwerk = "Pole_F" createVehicle [0,0,0];
_feuerwerk attachTo[player,[0,1.2,0]];
_feuerwerk setDir 90;
_feuerwerk setVariable["item","feuerwerkDeployed",true];

life_action_feuerwerkDeploy = player addAction["<t color='#FF0000'>Feuerwerk aufstellen</t>",{if(!isNull life_feuerwerk) then {detach life_feuerwerk; life_feuerwerk = ObjNull;}; player removeAction life_action_feuerwerkDeploy; life_action_feuerwerkDeploy = nil;},"",999,false,false,"",'!isNull life_feuerwerk'];
life_feuerwerk = _feuerwerk;
waitUntil {isNull life_feuerwerk};
if(!isNil "life_action_feuerwerkDeploy") then {player removeAction life_action_feuerwerkDeploy;};
if(isNull _feuerwerk) exitWith {life_feuerwerk = ObjNull;};
_feuerwerk setPos [(getPos _feuerwerk select 0),(getPos _feuerwerk select 1),0];
_feuerwerk allowDamage false;
_feuerwerk enableSimulation false;

if(animationState player != "DismountSideProne") then {
[player,"DismountSideProne",true] remoteExecCall ["life_fnc_animSync",0];
	player switchMove "DismountSideProne";
	player playMoveNow "DismountSideProne";
};
sleep 6;
player switchMove "GetOutMortar";
player playMoveNow "GetOutMortar";

[getPos _feuerwerk, 'random','red'] remoteExec ["life_fnc_callFireworks",0];

deleteVehicle _feuerwerk;
