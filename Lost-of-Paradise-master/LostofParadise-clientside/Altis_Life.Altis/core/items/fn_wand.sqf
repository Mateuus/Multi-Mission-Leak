/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_wand"];
_wand = "Land_CncBarrierMedium4_F" createVehicle [0,0,0];
_wand attachTo[player,[0,5.5,0.2]];
_wand setDir 180;
_wand setVariable["item","wandDeployed",true];
life_action_wandDeploy = player addAction["<t color='#00FF00'>Mauer aufstellen</t>",{if(!isNull life_wand) then {detach life_wand; life_wand = ObjNull;}; player removeAction life_action_wandDeploy; life_action_wandDeploy = nil;},"",999,false,false,"",'!isNull life_wand'];
life_wand = _wand;
waitUntil {isNull life_wand};
if(!isNil "life_action_wandDeploy") then {player removeAction life_action_wandDeploy;};
if(isNull _wand) exitWith {life_wand = ObjNull;};
_wand setPos [(getPos _wand select 0),(getPos _wand select 1),0];
_wand enableSimulation false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_wand"];
_wand = "Land_CncBarrierMedium4_F" createVehicle [0,0,0];
_wand attachTo[player,[0,5.5,0.2]];
_wand setDir 180;
_wand setVariable["item","wandDeployed",true];
life_action_wandDeploy = player addAction["<t color='#00FF00'>Mauer aufstellen</t>",{if(!isNull life_wand) then {detach life_wand; life_wand = ObjNull;}; player removeAction life_action_wandDeploy; life_action_wandDeploy = nil;},"",999,false,false,"",'!isNull life_wand'];
life_wand = _wand;
waitUntil {isNull life_wand};
if(!isNil "life_action_wandDeploy") then {player removeAction life_action_wandDeploy;};
if(isNull _wand) exitWith {life_wand = ObjNull;};
_wand setPos [(getPos _wand select 0),(getPos _wand select 1),0];
_wand enableSimulation false;
};