/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_matratze"];
_matratze = "Land_Sleeping_bag_blue_F" createVehicle [0,0,0];
_matratze attachTo[player,[0,5.5,0.2]];
_matratze setDir 180;
_matratze setVariable["item","matratzeDeployed",true];
life_action_matratzeDeploy = player addAction["<t color='#00FF00'>Matratze aufstellen</t>",{if(!isNull life_matratze) then {detach life_matratze; life_matratze = ObjNull;}; player removeAction life_action_matratzeDeploy; life_action_matratzeDeploy = nil;},"",999,false,false,"",'!isNull life_matratze'];
life_matratze = _matratze;
waitUntil {isNull life_matratze};
if(!isNil "life_action_matratzeDeploy") then {player removeAction life_action_matratzeDeploy;};
if(isNull _matratze) exitWith {life_matratze = ObjNull;};
_matratze setPos [(getPos _matratze select 0),(getPos _matratze select 1),0];
_matratze enableSimulation false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_matratze"];
_matratze = "Land_Sleeping_bag_blue_F" createVehicle [0,0,0];
_matratze attachTo[player,[0,5.5,0.2]];
_matratze setDir 180;
_matratze setVariable["item","matratzeDeployed",true];
life_action_matratzeDeploy = player addAction["<t color='#00FF00'>Matratze aufstellen</t>",{if(!isNull life_matratze) then {detach life_matratze; life_matratze = ObjNull;}; player removeAction life_action_matratzeDeploy; life_action_matratzeDeploy = nil;},"",999,false,false,"",'!isNull life_matratze'];
life_matratze = _matratze;
waitUntil {isNull life_matratze};
if(!isNil "life_action_matratzeDeploy") then {player removeAction life_action_matratzeDeploy;};
if(isNull _matratze) exitWith {life_matratze = ObjNull;};
_matratze setPos [(getPos _matratze select 0),(getPos _matratze select 1),0];
_matratze enableSimulation false;
};