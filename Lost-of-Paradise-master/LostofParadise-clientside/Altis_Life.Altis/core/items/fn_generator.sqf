/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_generator"];
_generator = "Land_Portable_generator_F" createVehicle [0,0,0];
_generator attachTo[player,[0,5.5,0.2]];
_generator setDir 180;
_generator setVariable["item","generatorDeployed",true];
life_action_generatorDeploy = player addAction["<t color='#00FF00'>Generator aufstellen</t>",{if(!isNull life_generator) then {detach life_generator; life_generator = ObjNull;}; player removeAction life_action_generatorDeploy; life_action_generatorDeploy = nil;},"",999,false,false,"",'!isNull life_generator'];
life_generator = _generator;
waitUntil {isNull life_generator};
if(!isNil "life_action_generatorDeploy") then {player removeAction life_action_generatorDeploy;};
if(isNull _generator) exitWith {life_generator = ObjNull;};
_generator setPos [(getPos _generator select 0),(getPos _generator select 1),0];
_generator enableSimulation false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_generator"];
_generator = "Land_Portable_generator_F" createVehicle [0,0,0];
_generator attachTo[player,[0,5.5,0.2]];
_generator setDir 180;
_generator setVariable["item","generatorDeployed",true];
life_action_generatorDeploy = player addAction["<t color='#00FF00'>Generator aufstellen</t>",{if(!isNull life_generator) then {detach life_generator; life_generator = ObjNull;}; player removeAction life_action_generatorDeploy; life_action_generatorDeploy = nil;},"",999,false,false,"",'!isNull life_generator'];
life_generator = _generator;
waitUntil {isNull life_generator};
if(!isNil "life_action_generatorDeploy") then {player removeAction life_action_generatorDeploy;};
if(isNull _generator) exitWith {life_generator = ObjNull;};
_generator setPos [(getPos _generator select 0),(getPos _generator select 1),0];
_generator enableSimulation false;
};