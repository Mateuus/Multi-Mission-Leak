/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_tisch"];
_tisch = "Land_WoodenTable_large_F" createVehicle [0,0,0];
_tisch attachTo[player,[0,5.5,0.2]];
_tisch setDir 180;
_tisch setVariable["item","tischDeployed",true];
life_action_tischDeploy = player addAction["<t color='#00FF00'>Tisch hinstellen</t>",{if(!isNull life_tisch) then {detach life_tisch; life_tisch = ObjNull;}; player removeAction life_action_tischDeploy; life_action_tischDeploy = nil;},"",999,false,false,"",'!isNull life_tisch'];
life_tisch = _tisch;
waitUntil {isNull life_tisch};
if(!isNil "life_action_tischDeploy") then {player removeAction life_action_tischDeploy;};
if(isNull _tisch) exitWith {life_tisch = ObjNull;};
_tisch setPos [(getPos _tisch select 0),(getPos _tisch select 1),0];
_tisch enableSimulation false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_tisch"];
_tisch = "Land_WoodenTable_large_F" createVehicle [0,0,0];
_tisch attachTo[player,[0,5.5,0.2]];
_tisch setDir 180;
_tisch setVariable["item","tischDeployed",true];
life_action_tischDeploy = player addAction["<t color='#00FF00'>Tisch hinstellen</t>",{if(!isNull life_tisch) then {detach life_tisch; life_tisch = ObjNull;}; player removeAction life_action_tischDeploy; life_action_tischDeploy = nil;},"",999,false,false,"",'!isNull life_tisch'];
life_tisch = _tisch;
waitUntil {isNull life_tisch};
if(!isNil "life_action_tischDeploy") then {player removeAction life_action_tischDeploy;};
if(isNull _tisch) exitWith {life_tisch = ObjNull;};
_tisch setPos [(getPos _tisch select 0),(getPos _tisch select 1),0];
_tisch enableSimulation false;
};